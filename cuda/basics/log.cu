#include <cuda_runtime.h>
#include <stdio.h>
#include <stdlib.h>

// Heavy transcendental math kernel — good for benchmarking -use_fast_math
// Each thread chains multiple dependent math ops so the compiler can't skip
// them.
__global__ void math_stress_kernel(float *input, float *output, int n,
                                   int iterations) {
  int tid = blockIdx.x * blockDim.x + threadIdx.x;

  if (tid < n) {
    float x = input[tid];

    // Chain dependent transcendental ops so nothing gets optimized away
    for (int i = 0; i < iterations; i++) {
      x = sinf(x) * cosf(x);       // trig
      x = logf(fabsf(x) + 1.0f);   // log (fabsf keeps it positive)
      x = expf(x * 0.01f);         // exp (scale down to avoid inf)
      x = sqrtf(x + 1.0f);         // sqrt
      x = powf(x, 1.1f);           // pow
      x = tanhf(x);                // hyperbolic trig
      x = atan2f(x, x + 0.5f);     // atan2
      x = rsqrtf(fabsf(x) + 1.0f); // reciprocal sqrt
    }

    output[tid] = x;
  }
}

int main() {
  int n = 1 << 22; // ~4 million elements
  int iterations = 100;
  size_t bytes = n * sizeof(float);

  // Host memory
  float *h_input = (float *)malloc(bytes);
  float *h_output = (float *)malloc(bytes);

  srand(42);
  for (int i = 0; i < n; i++) {
    h_input[i] = (rand() / (float)RAND_MAX) * 2.0f - 1.0f; // range [-1, 1]
  }

  // Device memory
  float *d_input, *d_output;
  cudaMalloc(&d_input, bytes);
  cudaMalloc(&d_output, bytes);

  cudaMemcpy(d_input, h_input, bytes, cudaMemcpyHostToDevice);

  // Kernel config
  int blockSize = 256;
  int gridSize = (n + blockSize - 1) / blockSize;

  // Warmup run (first kernel launch has overhead)
  math_stress_kernel<<<gridSize, blockSize>>>(d_input, d_output, n, iterations);
  cudaDeviceSynchronize();

  // Timed run using CUDA events (most accurate for GPU timing)
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);

  cudaEventRecord(start);
  math_stress_kernel<<<gridSize, blockSize>>>(d_input, d_output, n, iterations);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);

  float ms = 0.0f;
  cudaEventElapsedTime(&ms, start, stop);
  printf("Kernel execution time: %.3f ms\n", ms);

  // Sanity check — print first few outputs
  cudaMemcpy(h_output, d_output, bytes, cudaMemcpyDeviceToHost);
  printf("First 5 outputs: ");
  for (int i = 0; i < 5; i++) {
    printf("%.6f ", h_output[i]);
  }
  printf("\n");

  // Cleanup
  cudaEventDestroy(start);
  cudaEventDestroy(stop);
  cudaFree(d_input);
  cudaFree(d_output);
  free(h_input);
  free(h_output);

  return 0;
}

// OUTPUT:
// regular:
// Kernel execution time: 13.178 ms
// First 5 outputs: 0.797804 0.797804 0.797804 0.797804 0.797804
// fastmath:
// Kernel execution time: 5.209 ms
// First 5 outputs: 0.797804 0.797804 0.797804 0.797804 0.797804