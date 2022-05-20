#include <SDL2/SDL.h>
#include <GLES3/gl3.h>
#include <iostream>
#include <string>
#include <fstream>
#include <map>

SDL_Window *window;
SDL_GLContext gl_context;
SDL_Event event;

EGLDisplay  glDisplay;
EGLConfig   glConfig;
EGLContext  glContext;
EGLSurface  glSurface;

void init_GLES(const char* str, int width, int height){
	
	SDL_Init(SDL_INIT_VIDEO);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
	SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER,1);
	
	window = SDL_CreateWindow(
		str,
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		width,
		height,
		SDL_WINDOW_OPENGL|SDL_WINDOW_FULLSCREEN);
	gl_context=SDL_GL_CreateContext(window);
	//SDL_GL_SetSwapInterval(1); //enable vsync
}

void draw_frame(){
	glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
	glClear(GL_COLOR_BUFFER_BIT);
	SDL_GL_SwapWindow(window);
}

int main(){
	init_GLES("Hello, SDL!",2560,1440);
	while(true){
		SDL_PollEvent(&event);
		switch(event.type) {
			case SDL_QUIT:
				return false;
		case SDL_KEYDOWN:
			if(event.key.keysym.sym==SDLK_ESCAPE)
				return false;		
	}
		draw_frame();
	}
    SDL_GL_DeleteContext(gl_context);
	SDL_DestroyWindow(window);
	SDL_Quit();
}
