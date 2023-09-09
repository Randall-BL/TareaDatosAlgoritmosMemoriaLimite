# CMake generated Testfile for 
# Source directory: /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite
# Build directory: /home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(UnitTests "runUnitTest")
set_tests_properties(UnitTests PROPERTIES  _BACKTRACE_TRIPLES "/home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/CMakeLists.txt;14;add_test;/home/ismael/Desktop/TareaDatosAlgoritmosMemoriaLimite/CMakeLists.txt;0;")
subdirs("ext/googletest")
