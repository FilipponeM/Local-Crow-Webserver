# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /SharedDocker

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /SharedDocker/build

# Include any dependencies generated for this target.
include CMakeFiles/CSCN72050_Lab10.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/CSCN72050_Lab10.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/CSCN72050_Lab10.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CSCN72050_Lab10.dir/flags.make

CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o: CMakeFiles/CSCN72050_Lab10.dir/flags.make
CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o: ../main.cpp
CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o: CMakeFiles/CSCN72050_Lab10.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/SharedDocker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o -MF CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o.d -o CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o -c /SharedDocker/main.cpp

CMakeFiles/CSCN72050_Lab10.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CSCN72050_Lab10.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /SharedDocker/main.cpp > CMakeFiles/CSCN72050_Lab10.dir/main.cpp.i

CMakeFiles/CSCN72050_Lab10.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CSCN72050_Lab10.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /SharedDocker/main.cpp -o CMakeFiles/CSCN72050_Lab10.dir/main.cpp.s

# Object files for target CSCN72050_Lab10
CSCN72050_Lab10_OBJECTS = \
"CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o"

# External object files for target CSCN72050_Lab10
CSCN72050_Lab10_EXTERNAL_OBJECTS =

CSCN72050_Lab10: CMakeFiles/CSCN72050_Lab10.dir/main.cpp.o
CSCN72050_Lab10: CMakeFiles/CSCN72050_Lab10.dir/build.make
CSCN72050_Lab10: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.74.0
CSCN72050_Lab10: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.74.0
CSCN72050_Lab10: CMakeFiles/CSCN72050_Lab10.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/SharedDocker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable CSCN72050_Lab10"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CSCN72050_Lab10.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CSCN72050_Lab10.dir/build: CSCN72050_Lab10
.PHONY : CMakeFiles/CSCN72050_Lab10.dir/build

CMakeFiles/CSCN72050_Lab10.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CSCN72050_Lab10.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CSCN72050_Lab10.dir/clean

CMakeFiles/CSCN72050_Lab10.dir/depend:
	cd /SharedDocker/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /SharedDocker /SharedDocker /SharedDocker/build /SharedDocker/build /SharedDocker/build/CMakeFiles/CSCN72050_Lab10.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CSCN72050_Lab10.dir/depend
