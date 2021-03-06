#include <string.h>
#include <stdio.h>

#include <vector>
#include <string>
#include <chrono>

#include <GLFW/glfw3.h>

#include "glad/glad.h"
#include "glad/glad_egl.h"

#include "video.h"

using namespace std;

static const std::string sVertex = R"glsl(
#version 310 es
in vec2 VertexPosition;
in vec2 vertex_UV;
out vec2 UV;
void main()
{
	gl_Position = vec4(VertexPosition, 0, 1);
    UV = vertex_UV;
};
)glsl";

static const std::string sFragment = R"glsl(
#version 310 es
#extension GL_OES_EGL_image_external : enable
precision mediump float;
in vec2 UV;
uniform samplerExternalOES Texture;
out vec4 finalColor;
void main()
{
	vec4 fc = texture2D(Texture, UV);
	finalColor = vec4(fc.b, fc.g, fc.r, fc.a);
};
)glsl";

static const bool FullScreen = false;
static EGLDisplay EglDisplay;
static vector<GLuint> SourceTexture;

static void APIENTRY funcname(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar* message, const void* userParam)
{
	printf("GL CALLBACK: %s type = 0x%x, severity = 0x%x, message = %s\n",
		(type == GL_DEBUG_TYPE_ERROR ? "** GL ERROR **" : ""),
		type, severity, message);
}

unsigned CreateSourceImage(int dmaFd, int width, int height, int fourcc)
{
	EGLint attribs[] =
	{
		EGL_WIDTH, width,
		EGL_HEIGHT, height,
		EGL_LINUX_DRM_FOURCC_EXT, fourcc,
		EGL_DMA_BUF_PLANE0_FD_EXT, dmaFd,
		EGL_DMA_BUF_PLANE0_OFFSET_EXT, 0,
		EGL_DMA_BUF_PLANE0_PITCH_EXT, width * 4,
		EGL_NONE
	};
	EGLImage image = eglCreateImageKHR(EglDisplay, EGL_NO_CONTEXT, EGL_LINUX_DMA_BUF_EXT, NULL, attribs);
	if (image) {
		glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
		glPixelStorei(GL_UNPACK_SKIP_PIXELS, 0);
		glPixelStorei(GL_UNPACK_SKIP_ROWS, 0);
		glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
		GLuint texture;
		glGenTextures(1, &texture);
		glBindTexture(GL_TEXTURE_EXTERNAL_OES, texture);
		SourceTexture.push_back(texture);
		glTexParameteri(GL_TEXTURE_EXTERNAL_OES, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_EXTERNAL_OES, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
		glEGLImageTargetTexture2DOES(GL_TEXTURE_EXTERNAL_OES, image);
		glBindTexture(GL_TEXTURE_EXTERNAL_OES, 0);
		eglDestroyImageKHR(EglDisplay, image);
		printf("Created image #%d %dx%d, fourcc %.4s, DMA %d, texture %u\n", SourceTexture.size() - 1, width, height, (char*)&fourcc, dmaFd, texture);
		return SourceTexture.size() - 1; // Index of texture name
	}
	else
	{
		printf("eglCreateImageKHR: error 0x%x\n", eglGetError());
		return -1;
	}
}

void SelectTexture(unsigned index)
{
	if (index < SourceTexture.size())
	{
		GLuint texture = SourceTexture[index];
		glBindTexture(GL_TEXTURE_EXTERNAL_OES, texture);
	}
}

int main()
{
	glfwInit();
	glfwWindowHint(GLFW_VISIBLE, GLFW_TRUE);
	glfwWindowHint(GLFW_DOUBLEBUFFER, GLFW_TRUE);
	glfwWindowHint(GLFW_CLIENT_API, GLFW_OPENGL_ES_API);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
	glfwWindowHint(GLFW_CONTEXT_CREATION_API, GLFW_EGL_CONTEXT_API);
	GLFWmonitor* monitor = glfwGetPrimaryMonitor();
	const GLFWvidmode* mode = glfwGetVideoMode(monitor);
	GLFWwindow* glfwWindow = glfwCreateWindow(mode->width, mode->height, "Raspberry PI 4 tearing", FullScreen ? monitor : nullptr, nullptr);
	glfwMakeContextCurrent(glfwWindow);
	EglDisplay = eglGetCurrentDisplay();
	eglGetCurrentDisplay();
	glfwSwapInterval(1);
	gladLoadGLES2Loader((GLADloadproc)glfwGetProcAddress);
	gladLoadEGLLoader((GLADloadproc)glfwGetProcAddress);

	glDebugMessageCallback(funcname, nullptr);
	glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
	//glEnable(GL_DEBUG_OUTPUT);

	SVideo video;
	video.Create();

	GLint result = GL_FALSE;
	const GLchar* ShaderSourcePointer;
	GLuint VertexShaderID = glCreateShader(GL_VERTEX_SHADER);
	ShaderSourcePointer = sVertex.c_str();
	glShaderSource(VertexShaderID, 1, &ShaderSourcePointer, NULL);
	glCompileShader(VertexShaderID);
	glGetShaderiv(VertexShaderID, GL_COMPILE_STATUS, &result);
	if (result == GL_FALSE) {
		int InfoLogLength;
		glGetShaderiv(VertexShaderID, GL_INFO_LOG_LENGTH, &InfoLogLength);
		vector<char> ShaderErrorMessage(InfoLogLength + 1);
		glGetShaderInfoLog(VertexShaderID, InfoLogLength, NULL, &ShaderErrorMessage[0]);
		printf("%s\n", &ShaderErrorMessage[0]);
	}

	GLuint FragmentShaderID = glCreateShader(GL_FRAGMENT_SHADER);
	ShaderSourcePointer = sFragment.c_str();
	glShaderSource(FragmentShaderID, 1, &ShaderSourcePointer, NULL);
	glCompileShader(FragmentShaderID);
	glGetShaderiv(FragmentShaderID, GL_COMPILE_STATUS, &result);
	if (result == GL_FALSE) {
		int InfoLogLength;
		glGetShaderiv(FragmentShaderID, GL_INFO_LOG_LENGTH, &InfoLogLength);
		vector<char> ShaderErrorMessage(InfoLogLength + 1);
		glGetShaderInfoLog(FragmentShaderID, InfoLogLength, NULL, &ShaderErrorMessage[0]);
		printf("%s\n", &ShaderErrorMessage[0]);
	}

	vector<GLuint> shaderIDs = { VertexShaderID, FragmentShaderID };
	GLuint program = glCreateProgram();
	for (auto& sID : shaderIDs)
	{
		glAttachShader(program, sID);
	}
	glLinkProgram(program);
	glGetProgramiv(program, GL_LINK_STATUS, &result);
	if (result == GL_FALSE) {
		int InfoLogLength;
		glGetProgramiv(program, GL_INFO_LOG_LENGTH, &InfoLogLength);
		vector<char> ProgramErrorMessage(InfoLogLength + 1);
		glGetProgramInfoLog(program, InfoLogLength, NULL, &ProgramErrorMessage[0]);
		printf("%s\n", &ProgramErrorMessage[0]);
	}

	GLuint uvLoc = glGetAttribLocation(program, "vertex_UV");
	GLuint vertexLoc = glGetAttribLocation(program, "VertexPosition");

	glUseProgram(program);

	GLuint vao;
	glGenVertexArrays(1, &vao);
	glBindVertexArray(vao);

	vector<float> sourceGrid = { 0, 1, 1, 1, 0, 0, 1, 0 };
	GLuint sourceBuffer;
	glGenBuffers(1, &sourceBuffer);
	glBindBuffer(GL_ARRAY_BUFFER, sourceBuffer);
	glBufferData(GL_ARRAY_BUFFER, sourceGrid.size() * sizeof(float), sourceGrid.data(), GL_STATIC_DRAW);
	glEnableVertexAttribArray(uvLoc);
	glVertexAttribPointer(uvLoc, 2, GL_FLOAT, GL_FALSE, 0, nullptr);

	vector<float> targetGrid = { -1, -1, 1, -1, -1, 1, 1, 1 };
	GLuint targetBuffer;
	glGenBuffers(1, &targetBuffer);
	glBindBuffer(GL_ARRAY_BUFFER, targetBuffer);
	glBufferData(GL_ARRAY_BUFFER, targetGrid.size() * sizeof(float), targetGrid.data(), GL_STATIC_DRAW);
	glEnableVertexAttribArray(vertexLoc);
	glVertexAttribPointer(vertexLoc, 2, GL_FLOAT, GL_FALSE, 0, nullptr);

	vector<GLushort> indexBuffer = { 0, 1, 2, 3, 1, 2 };
	GLuint indexVertices;
	glGenBuffers(1, &indexVertices);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexVertices);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLushort) * indexBuffer.size(), indexBuffer.data(), GL_STATIC_DRAW);

	GLuint targetTexture;
	glGenTextures(1, &targetTexture);
	glBindTexture(GL_TEXTURE_2D, targetTexture);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, mode->width, mode->height, 0, GL_RGB, GL_UNSIGNED_BYTE, nullptr);

	while (!glfwWindowShouldClose(glfwWindow))
	{
		video.FrameProcessing();
		glDrawElements(GL_TRIANGLES, indexBuffer.size(), GL_UNSIGNED_SHORT, nullptr);
		glfwSwapBuffers(glfwWindow);
		glfwPollEvents();
	}

	return 0;
}
