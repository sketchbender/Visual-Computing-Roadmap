# PyTorch & Machine Learning

Core machine learning fundamentals — PyTorch framework, training, and GPU-accelerated ML.

This folder is for **pure ML and PyTorch skills**. Neural/inverse rendering applications live in the separate `neural-rendering/` folder.

---

## Focus Areas

- **Tensors & Autograd** — tensor operations, automatic differentiation, computational graphs
- **Training Loops** — datasets, dataloaders, optimizers, loss functions, schedulers
- **Neural Network Modules** — nn.Module, custom layers, feedforward networks, CNNs
- **Model Export** — ONNX export for Unreal NNE / TensorRT deployment
- **Custom CUDA Operators** — PyTorch C++/CUDA extensions for custom GPU ops
- **Reinforcement Learning** — policy networks, PPO, reward shaping (for game AI via NNE)
- **Debugging & Profiling** — PyTorch Profiler, gradient debugging, memory tracking

---

## Structure

```text
pytorch/
├── basics/              # tensors, autograd, simple networks
├── training/            # training loops, datasets, optimizers
├── architectures/       # MLPs, CNNs, custom modules
├── custom-ops/          # PyTorch C++/CUDA extensions
├── export/              # ONNX export, TensorRT conversion
├── reinforcement/       # RL basics, policy networks for game AI
├── mini-projects/       # standalone ML projects
├── notes/               # learning notes, architecture decisions
└── README.md
```

---

## Key Resources

- PyTorch Documentation & Tutorials
- 3Blue1Brown — Neural Networks (YouTube)
- *Programming Massively Parallel Processors* — Kirk & Hwu (for custom ops)
- NVIDIA TensorRT Documentation

---

## Status

`[ ]` Not started — will begin after C++ and CUDA foundations are solid
