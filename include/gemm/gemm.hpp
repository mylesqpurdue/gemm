#pragma once

namespace gemm {
  struct Block { int MB, NB, KB; }; // unused for naive, kept for uniform CLI
  void gemm_naive(int M, int N, int K, const float* A, const float* B, float* C, int lda, int ldb, int ldc);
}