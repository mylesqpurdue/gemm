# gemm-sprint
Goal: Build and explain a high-performance FP32 GEMM on CPU, moving from naïve to blocked to packed to AVX2 micro-kernel, and compare against tuned BLAS (OpenBLAS/BLIS). Deliver clean plots + a short write-up that demonstrates performance-engineering chops.

Hardware focus: Ryzen 7 8840 (Zen 4). AVX2 primary; AVX-512 optional. 64B alignment, OpenMP over tiles.

Method (phases):

Naïve: triple loop, correctness oracle.

Blocked + OpenMP: cache-sized tiles, collapse(2) schedule(static).

Packed: BLIS-style panels for A/B, 64B-aligned, simple prefetch.

Micro-kernel (AVX2): 8×8 register tile, unrolled K, FMA; optional AVX-512 variant.

Baselines: OpenBLAS/BLIS on same sizes.

Sweeps & Plots: N ∈ {256…4096}; GFLOP/s vs N; brief roofline note (compute vs bandwidth bound).