cmake_minimum_required(VERSION 3.24)

project(arrow LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Arrow REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE Arrow::arrow_shared)