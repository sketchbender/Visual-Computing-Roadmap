# Vulkan

Low-level GPU graphics API — cross-vendor, explicit control over the rendering pipeline.

---

## Focus Areas

- **Instance & Device Setup** — physical/logical device, queues, validation layers
- **Swapchain & Presentation** — surface creation, image views, present modes
- **Render Passes & Framebuffers** — subpasses, attachments, dependencies
- **Graphics Pipeline** — pipeline layout, shader stages, fixed-function state
- **Command Buffers** — recording, submission, primary/secondary buffers
- **Synchronization** — fences, semaphores, barriers, pipeline barriers
- **Memory Management** — buffer/image allocation, memory types, VMA
- **Descriptor Sets** — descriptor pools, layouts, binding, push descriptors
- **Compute Pipelines** — compute shaders, dispatch, storage buffers
- **Ray Tracing** — acceleration structures, ray tracing pipeline (VK_KHR_ray_tracing)

---

## Structure

```text
vulkan/
├── setup/               # instance, device, validation layers, swapchain
├── triangle/            # hello triangle, first pipeline
├── buffers/             # vertex buffers, index buffers, uniform buffers
├── textures/            # image loading, samplers, texture mapping
├── descriptors/         # descriptor sets, push constants experiments
├── rendering/           # render passes, deferred, forward rendering
├── compute/             # compute shader experiments
├── synchronization/     # sync primitives, multi-queue experiments
├── mini-projects/       # standalone Vulkan projects
├── notes/               # learning notes, API reference
└── README.md
```

---

## Key Resources

- [vulkan-tutorial.com](https://vulkan-tutorial.com/)
- *Real-Time Rendering, 4th Edition* — Akenine-Möller et al.
- Vulkan Specification (Khronos)
- Sascha Willems Vulkan Examples

---

## Status

`[ ]` In progress — SDK installed, starting from scratch
