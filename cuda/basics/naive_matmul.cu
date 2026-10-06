#include <cuda_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void matmul(float *a, float *b, float *c, int m, int n, int k) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      float sum = 0;
      for (int l = 0; l < k; l++) {
        sum += a[i * k + l] * b[l * n + j];
      }
      c[i * n + j] = sum;
    }
  }
}

__global__ void matmul_kernel(float *a, float *b, float *c, int m, int n,
                              int k) {
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  int col = blockIdx.x * blockDim.x + threadIdx.x;

  if (row < m && col < n) {
    float sum = 0;
    for (int l = 0; l < k; l++) {
      sum += a[row * k + l] * b[l * n + col];
    }
    c[row * n + col] = sum;
  }
}

int main() {
  int m = 1024;
  int n = 1024;
  int k = 1024;

  size_t size_a = m * k * sizeof(float);
  size_t size_b = k * n * sizeof(float);
  size_t size_c = m * n * sizeof(float);

  // ── Phase 1: ALLOCATE (host + device twins) ──
  float *a = (float *)malloc(size_a);
  float *b = (float *)malloc(size_b);
  float *c_cpu = (float *)malloc(size_c);
  float *c_gpu = (float *)malloc(size_c);

  float *d_a, *d_b, *d_c;
  cudaMalloc(&d_a, size_a);
  cudaMalloc(&d_b, size_b);
  cudaMalloc(&d_c, size_c);

  // Fill input matrices with random data
  srand(42);
  for (int i = 0; i < m * k; i++) {
    a[i] = rand() / (float)RAND_MAX;
  }
  for (int i = 0; i < k * n; i++) {
    b[i] = rand() / (float)RAND_MAX;
  }

  // ── Phase 2: TRANSFER (Host → Device) ──
  cudaMemcpy(d_a, a, size_a, cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, b, size_b, cudaMemcpyHostToDevice);

  // ── Phase 3: COMPUTE ──
  dim3 blockSize(16, 16);
  dim3 gridSize((n + 15) / 16, (m + 15) / 16);

  // Warmup
  matmul_kernel<<<gridSize, blockSize>>>(d_a, d_b, d_c, m, n, k);
  cudaDeviceSynchronize();

  // Time GPU matmul
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);

  cudaEventRecord(start);
  matmul_kernel<<<gridSize, blockSize>>>(d_a, d_b, d_c, m, n, k);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);

  float gpu_time = 0.0f;
  cudaEventElapsedTime(&gpu_time, start, stop);

  // Time CPU matmul (use clock(), NOT cuda events — those only measure GPU
  // time)
  clock_t cpu_start = clock();
  matmul(a, b, c_cpu, m, n, k);
  clock_t cpu_end = clock();

  float cpu_time = 1000.0f * (cpu_end - cpu_start) / CLOCKS_PER_SEC;

  printf("CPU matmul time: %.3f ms\n", cpu_time);
  printf("GPU matmul time: %.3f ms\n", gpu_time);
  printf("Speedup: %.1fx\n", cpu_time / gpu_time);

  // ── Phase 4: TRANSFER BACK (Device → Host) ──
  cudaMemcpy(c_gpu, d_c, size_c, cudaMemcpyDeviceToHost);

  // Verify correctness (compare CPU vs GPU results)
  float max_err = 0.0f;
  for (int i = 0; i < m * n; i++) {
    float err = fabsf(c_cpu[i] - c_gpu[i]);
    if (err > max_err)
      max_err = err;
  }
  printf("Max error (CPU vs GPU): %e\n", max_err);

  // ── Phase 5: CLEANUP ──
  cudaEventDestroy(start);
  cudaEventDestroy(stop);
  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
  free(a);
  free(b);
  free(c_cpu);
  free(c_gpu);

  return 0;
}
