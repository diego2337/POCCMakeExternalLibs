# CMAKE generated file: DO NOT EDIT!
# Generated by CMake Version 3.22
cmake_policy(SET CMP0009 NEW)

# HEADERS at CMakeLists.txt:34 (file)
file(GLOB_RECURSE NEW_GLOB LIST_DIRECTORIES false "/workspaces/POCCMakeExternalLibs/XMLSerializer/include/*.h")
set(OLD_GLOB
  "/workspaces/POCCMakeExternalLibs/XMLSerializer/include/HelloXML.h"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/workspaces/POCCMakeExternalLibs/build/CMakeFiles/cmake.verify_globs")
endif()

# SOURCES at CMakeLists.txt:35 (file)
file(GLOB_RECURSE NEW_GLOB LIST_DIRECTORIES false "/workspaces/POCCMakeExternalLibs/XMLSerializer/src/*.cpp")
set(OLD_GLOB
  "/workspaces/POCCMakeExternalLibs/XMLSerializer/src/HelloXML.cpp"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/workspaces/POCCMakeExternalLibs/build/CMakeFiles/cmake.verify_globs")
endif()
