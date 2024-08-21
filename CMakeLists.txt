cmake_minimum_required(VERSION 3.16)

project(gpuProgramming LANGUAGES CXX CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(simple test.cpp)

target_include_directories(simple PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/engine)

find_package(CUDAToolkit REQUIRED)
find_package(ARROW REQUIRED)
 
target_link_libraries(simple PRIVATE CUDA::cudart arrow_shared)
