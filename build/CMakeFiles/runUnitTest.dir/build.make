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
CMAKE_SOURCE_DIR = /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build

# Include any dependencies generated for this target.
include CMakeFiles/runUnitTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/runUnitTest.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/runUnitTest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/runUnitTest.dir/flags.make

CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o: CMakeFiles/runUnitTest.dir/flags.make
CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o: ../src/pagesort.cpp
CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o: CMakeFiles/runUnitTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o -MF CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o.d -o CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o -c /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/src/pagesort.cpp

CMakeFiles/runUnitTest.dir/src/pagesort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runUnitTest.dir/src/pagesort.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/src/pagesort.cpp > CMakeFiles/runUnitTest.dir/src/pagesort.cpp.i

CMakeFiles/runUnitTest.dir/src/pagesort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runUnitTest.dir/src/pagesort.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/src/pagesort.cpp -o CMakeFiles/runUnitTest.dir/src/pagesort.cpp.s

CMakeFiles/runUnitTest.dir/src/test.cpp.o: CMakeFiles/runUnitTest.dir/flags.make
CMakeFiles/runUnitTest.dir/src/test.cpp.o: ../src/test.cpp
CMakeFiles/runUnitTest.dir/src/test.cpp.o: CMakeFiles/runUnitTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/runUnitTest.dir/src/test.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/runUnitTest.dir/src/test.cpp.o -MF CMakeFiles/runUnitTest.dir/src/test.cpp.o.d -o CMakeFiles/runUnitTest.dir/src/test.cpp.o -c /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/src/test.cpp

CMakeFiles/runUnitTest.dir/src/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runUnitTest.dir/src/test.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/src/test.cpp > CMakeFiles/runUnitTest.dir/src/test.cpp.i

CMakeFiles/runUnitTest.dir/src/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runUnitTest.dir/src/test.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/src/test.cpp -o CMakeFiles/runUnitTest.dir/src/test.cpp.s

# Object files for target runUnitTest
runUnitTest_OBJECTS = \
"CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o" \
"CMakeFiles/runUnitTest.dir/src/test.cpp.o"

# External object files for target runUnitTest
runUnitTest_EXTERNAL_OBJECTS =

runUnitTest: CMakeFiles/runUnitTest.dir/src/pagesort.cpp.o
runUnitTest: CMakeFiles/runUnitTest.dir/src/test.cpp.o
runUnitTest: CMakeFiles/runUnitTest.dir/build.make
runUnitTest: lib/libgtest.a
runUnitTest: lib/libgtest_main.a
runUnitTest: lib/libgtest.a
runUnitTest: CMakeFiles/runUnitTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable runUnitTest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/runUnitTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/runUnitTest.dir/build: runUnitTest
.PHONY : CMakeFiles/runUnitTest.dir/build

CMakeFiles/runUnitTest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/runUnitTest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/runUnitTest.dir/clean

CMakeFiles/runUnitTest.dir/depend:
	cd /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build/CMakeFiles/runUnitTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/runUnitTest.dir/depend

