# CUDA

GPU programming and parallel computing using NVIDIA CUDA C++.

---

## Focus Areas

- **Kernel Programming** — thread indexing, grid/block dimensions, launch configurations
- **Memory Hierarchy** — global, shared, constant, texture memory; coalescing patterns
- **Warp-Level Programming** — warp scheduling, divergence, shuffle instructions
- **Occupancy & Performance** — occupancy calculator, register pressure, instruction throughput
- **Streams & Concurrency** — async operations, multi-stream execution, events
- **Tensor Cores** — WMMA API, mixed-precision compute
- **CUDA-Vulkan Interop** — external memory, semaphore sharing
- **Profiling** — Nsight Compute, Nsight Systems, nvprof

---

## Structure

```text
cuda/
├── basics/              # hello CUDA, vector add, thread indexing
├── memory/              # shared memory, coalescing, memory transfer patterns
├── kernels/             # custom kernel implementations
├── optimization/        # occupancy tuning, warp-level optimizations
├── interop/             # Vulkan-CUDA interop experiments
├── mini-projects/       # standalone CUDA projects
├── benchmarks/          # performance measurements and comparisons
├── notes/               # learning notes, architecture diagrams
└── README.md
```

---

## Key Resources

- *Programming Massively Parallel Processors* — Kirk & Hwu (PMPP)
- *Professional CUDA C Programming* — John Cheng et al.
- NVIDIA CUDA Programming Guide
- NVIDIA Developer Blog

---

## Status

`[ ]` In progress — kernel basics and memory patterns
