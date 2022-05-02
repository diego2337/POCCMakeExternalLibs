# Specify the minimum version for CMake
cmake_minimum_required(VERSION 3.22.1 FATAL_ERROR)

# Project's name
project(Server CXX)

set(PROJECT_ABSOLUTE_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Link this 'library' to set the c++ standard / compile-time options requested
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_14)

if(NOT CMAKE_DEBUG_POSTFIX)
  set(CMAKE_DEBUG_POSTFIX d)
endif()

set(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} -Wall -Wno-sign-compare -D_XOPEN_SOURCE=500 -D_REENTRANT -D_THREAD_SAFE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DPOCO_HAVE_FD_EPOLL -DBOOST_LOG_DYN_LINK"
)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g3 -gdwarf-2")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -lz")

# -fPIC
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Set the output folder where your program will be created
if(NOT LIBRARY_OUTPUT_PATH)
  set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/lib)
endif()

# Compile paths
file(GLOB_RECURSE HEADERS CONFIGURE_DEPENDS "${PROJECT_ABSOLUTE_ROOT_DIR}/include/*.h")
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "${PROJECT_ABSOLUTE_ROOT_DIR}/src/*.cpp")

set(INCLUDE_DIRS "")

# Computes all header files
foreach(_headerFile ${HEADERS})
  get_filename_component(_dir ${_headerFile} PATH)
  list (APPEND INCLUDE_DIRS ${_dir})
endforeach()


# Find XMLSerializer library
find_library(XMLSerializerLib ${CMAKE_CURRENT_SOURCE_DIR}/../build/lib/)

# Create executable
add_executable(${THIS} ${SOURCES})
target_include_directories(${THIS} PRIVATE ${INCLUDE_DIRS})

# target_link_libraries(${THIS} XMLSerializerLib )