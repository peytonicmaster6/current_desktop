# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/Desktop/opengles3-book

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Desktop/opengles3-book

# Include any dependencies generated for this target.
include Common/CMakeFiles/Common.dir/depend.make

# Include the progress variables for this target.
include Common/CMakeFiles/Common.dir/progress.make

# Include the compile flags for this target's objects.
include Common/CMakeFiles/Common.dir/flags.make

Common/CMakeFiles/Common.dir/Source/esShader.c.o: Common/CMakeFiles/Common.dir/flags.make
Common/CMakeFiles/Common.dir/Source/esShader.c.o: Common/Source/esShader.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/opengles3-book/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Common/CMakeFiles/Common.dir/Source/esShader.c.o"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/Source/esShader.c.o   -c /home/pi/Desktop/opengles3-book/Common/Source/esShader.c

Common/CMakeFiles/Common.dir/Source/esShader.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/Source/esShader.c.i"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/opengles3-book/Common/Source/esShader.c > CMakeFiles/Common.dir/Source/esShader.c.i

Common/CMakeFiles/Common.dir/Source/esShader.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/Source/esShader.c.s"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/opengles3-book/Common/Source/esShader.c -o CMakeFiles/Common.dir/Source/esShader.c.s

Common/CMakeFiles/Common.dir/Source/esShapes.c.o: Common/CMakeFiles/Common.dir/flags.make
Common/CMakeFiles/Common.dir/Source/esShapes.c.o: Common/Source/esShapes.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/opengles3-book/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object Common/CMakeFiles/Common.dir/Source/esShapes.c.o"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/Source/esShapes.c.o   -c /home/pi/Desktop/opengles3-book/Common/Source/esShapes.c

Common/CMakeFiles/Common.dir/Source/esShapes.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/Source/esShapes.c.i"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/opengles3-book/Common/Source/esShapes.c > CMakeFiles/Common.dir/Source/esShapes.c.i

Common/CMakeFiles/Common.dir/Source/esShapes.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/Source/esShapes.c.s"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/opengles3-book/Common/Source/esShapes.c -o CMakeFiles/Common.dir/Source/esShapes.c.s

Common/CMakeFiles/Common.dir/Source/esTransform.c.o: Common/CMakeFiles/Common.dir/flags.make
Common/CMakeFiles/Common.dir/Source/esTransform.c.o: Common/Source/esTransform.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/opengles3-book/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object Common/CMakeFiles/Common.dir/Source/esTransform.c.o"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/Source/esTransform.c.o   -c /home/pi/Desktop/opengles3-book/Common/Source/esTransform.c

Common/CMakeFiles/Common.dir/Source/esTransform.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/Source/esTransform.c.i"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/opengles3-book/Common/Source/esTransform.c > CMakeFiles/Common.dir/Source/esTransform.c.i

Common/CMakeFiles/Common.dir/Source/esTransform.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/Source/esTransform.c.s"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/opengles3-book/Common/Source/esTransform.c -o CMakeFiles/Common.dir/Source/esTransform.c.s

Common/CMakeFiles/Common.dir/Source/esUtil.c.o: Common/CMakeFiles/Common.dir/flags.make
Common/CMakeFiles/Common.dir/Source/esUtil.c.o: Common/Source/esUtil.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/opengles3-book/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object Common/CMakeFiles/Common.dir/Source/esUtil.c.o"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/Source/esUtil.c.o   -c /home/pi/Desktop/opengles3-book/Common/Source/esUtil.c

Common/CMakeFiles/Common.dir/Source/esUtil.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/Source/esUtil.c.i"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/opengles3-book/Common/Source/esUtil.c > CMakeFiles/Common.dir/Source/esUtil.c.i

Common/CMakeFiles/Common.dir/Source/esUtil.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/Source/esUtil.c.s"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/opengles3-book/Common/Source/esUtil.c -o CMakeFiles/Common.dir/Source/esUtil.c.s

Common/CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.o: Common/CMakeFiles/Common.dir/flags.make
Common/CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.o: Common/Source/LinuxX11/esUtil_X11.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/opengles3-book/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object Common/CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.o"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.o   -c /home/pi/Desktop/opengles3-book/Common/Source/LinuxX11/esUtil_X11.c

Common/CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.i"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/Desktop/opengles3-book/Common/Source/LinuxX11/esUtil_X11.c > CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.i

Common/CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.s"
	cd /home/pi/Desktop/opengles3-book/Common && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/Desktop/opengles3-book/Common/Source/LinuxX11/esUtil_X11.c -o CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.s

# Object files for target Common
Common_OBJECTS = \
"CMakeFiles/Common.dir/Source/esShader.c.o" \
"CMakeFiles/Common.dir/Source/esShapes.c.o" \
"CMakeFiles/Common.dir/Source/esTransform.c.o" \
"CMakeFiles/Common.dir/Source/esUtil.c.o" \
"CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.o"

# External object files for target Common
Common_EXTERNAL_OBJECTS =

Common/libCommon.a: Common/CMakeFiles/Common.dir/Source/esShader.c.o
Common/libCommon.a: Common/CMakeFiles/Common.dir/Source/esShapes.c.o
Common/libCommon.a: Common/CMakeFiles/Common.dir/Source/esTransform.c.o
Common/libCommon.a: Common/CMakeFiles/Common.dir/Source/esUtil.c.o
Common/libCommon.a: Common/CMakeFiles/Common.dir/Source/LinuxX11/esUtil_X11.c.o
Common/libCommon.a: Common/CMakeFiles/Common.dir/build.make
Common/libCommon.a: Common/CMakeFiles/Common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Desktop/opengles3-book/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C static library libCommon.a"
	cd /home/pi/Desktop/opengles3-book/Common && $(CMAKE_COMMAND) -P CMakeFiles/Common.dir/cmake_clean_target.cmake
	cd /home/pi/Desktop/opengles3-book/Common && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Common/CMakeFiles/Common.dir/build: Common/libCommon.a

.PHONY : Common/CMakeFiles/Common.dir/build

Common/CMakeFiles/Common.dir/clean:
	cd /home/pi/Desktop/opengles3-book/Common && $(CMAKE_COMMAND) -P CMakeFiles/Common.dir/cmake_clean.cmake
.PHONY : Common/CMakeFiles/Common.dir/clean

Common/CMakeFiles/Common.dir/depend:
	cd /home/pi/Desktop/opengles3-book && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Desktop/opengles3-book /home/pi/Desktop/opengles3-book/Common /home/pi/Desktop/opengles3-book /home/pi/Desktop/opengles3-book/Common /home/pi/Desktop/opengles3-book/Common/CMakeFiles/Common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Common/CMakeFiles/Common.dir/depend
