#!/bin/bash

# Create build directory and compile
mkdir -p build
mkdir -p data/runs
cd build

# Configure with CMake (Release build with optimizations)
cmake -DCMAKE_BUILD_TYPE=Release ..

# Build with parallel compilation
cmake --build . -j$(nproc)

echo "Build complete! You can now run:"
echo "./gemm_bench --N 1024 --reps 5 --csv ../data/runs/run.csv"