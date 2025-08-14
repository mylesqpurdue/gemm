cmake_minimum_required(VERSION 3.16)
project(gemm_bench CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Release build flags for performance
if(MSVC)
    set(CMAKE_CXX_FLAGS_RELEASE "/O2 /DNDEBUG /fp:fast")
else()
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -march=native -DNDEBUG -ffast-math")
endif()

# Find OpenMP for vectorization hints
find_package(OpenMP)

# Include directories
include_directories(include)

# Create the benchmark executable
add_executable(gemm_bench
    bench/bench_main.cpp
    cpu/gemm_naive.cpp
)

# Link OpenMP if available
if(OpenMP_CXX_FOUND)
    target_link_libraries(gemm_bench OpenMP::OpenMP_CXX)
endif()

# Platform-specific settings
if(WIN32)
    # Nothing special needed for Windows
elseif(UNIX)
    # Link pthread for std::thread support if needed later
    target_link_libraries(gemm_bench pthread)
endif()

# Ensure we use Release build by default
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()