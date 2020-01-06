cmake_minimum_required(VERSION 2.8)
project(raidmeter)



SET(CMAKE_C_COMPILER "g++")
#set(CMAKE_CXX_STANDARD 11)
ADD_DEFINITIONS(-g -lrt -fpermissive)
link_libraries("/usr/lib/x86_64-linux-gnu/librt.so")
#include_directories( /usr/include)
set(SOURCE_FILES raidmeter_f.cpp bch.c bch.h )
add_executable(raidmeter ${SOURCE_FILES})
add_executable(distribute distribute_gen.c)