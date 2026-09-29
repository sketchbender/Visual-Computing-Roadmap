#include <stdio.h>

__global__ void coord(void) {
  int global_x = blockIdx.x * blockDim.x + threadIdx.x;
  int global_y = blockIdx.y * blockDim.y + threadIdx.y;
  int global_z = blockIdx.z * blockDim.z + threadIdx.z;
  printf("global_x: %d, global_y: %d, global_z: %d\n", global_x, global_y,
         global_z);
}

__global__ void flatindex(void) {
  int global_x = blockIdx.x * blockDim.x + threadIdx.x;
  int global_y = blockIdx.y * blockDim.y + threadIdx.y;
  int global_z = blockIdx.z * blockDim.z + threadIdx.z;

  int grid_width = gridDim.x * blockDim.x;
  int grid_height = gridDim.y * blockDim.y;
  int grid_depth = gridDim.z * blockDim.z;

  int flat_id =
      global_x + global_y * grid_width + global_z * grid_width * grid_height;
  printf("flat_id: %d\n", flat_id);
}

int main() {
  const int g_x = 2, g_y = 2, g_z = 2;
  const int b_x = 2, b_y = 2, b_z = 2;

  int blocks_per_grid = g_x * g_y * g_z;
  int threads_per_block = b_x * b_y * b_z;

  printf("%d blocks/grid\n", blocks_per_grid);
  printf("%d threads/block\n", threads_per_block);
  printf("%d total threads\n", blocks_per_grid * threads_per_block);

  dim3 gridsize(g_x, g_y, g_z);
  dim3 blocksize(b_x, b_y, b_z);

  coord<<<gridsize, blocksize>>>();
  cudaDeviceSynchronize();

  printf("\n\n\n");

  flatindex<<<gridsize, blocksize>>>();
  cudaDeviceSynchronize();
}
