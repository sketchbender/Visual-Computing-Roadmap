# Neural & Inverse Rendering

The intersection of **machine learning and computer graphics** — learned representations, differentiable rendering, and neural scene reconstruction.

This is separate from core ML/PyTorch (which lives in `pytorch/`) and from traditional rendering (which lives in `vulkan/` and `shaders/`). This folder is specifically for the space where the two meet.

---

## Focus Areas

### Neural Rendering
- **NeRF** — neural radiance fields, volumetric rendering, positional encoding
- **3D Gaussian Splatting** — point-based neural rendering, real-time novel view synthesis
- **Neural Radiance Caching** — learned GI approximations for real-time use
- **InstantNGP** — hash encoding, multi-resolution grids, fast training
- **Neural Denoising** — learned denoisers for ray-traced output (SVGF, NVIDIA OptiX denoiser)
- **Neural Super Resolution** — learned upscaling (DLSS-style approaches)
- **Neural Materials / BRDFs** — learned material models, cooperative vectors in HLSL

### Inverse Rendering
- **Differentiable Rendering** — gradient-based optimization through the rendering pipeline
- **Material Estimation** — recovering BRDFs from images
- **Geometry Reconstruction** — implicit surfaces, signed distance fields, mesh extraction
- **Relighting** — image-based relighting, environment map estimation
- **Scene Decomposition** — separating geometry, materials, and lighting from images

### Integration
- **CUDA Kernels for Rendering** — custom CUDA implementations of rendering operations
- **Vulkan-ML Interop** — feeding neural network output into the Vulkan pipeline
- **Unreal NNE** — deploying trained models inside Unreal's rendering pipeline
- **TensorRT** — inference optimization for real-time neural rendering

---

## Structure

```text
neural-rendering/
├── nerf/                # NeRF implementations and experiments
├── gaussian-splatting/  # 3DGS experiments
├── denoising/           # neural denoiser implementations
├── super-resolution/    # learned upscaling experiments
├── materials/           # neural BRDFs, learned material models
├── differentiable/      # differentiable rendering, inverse problems
├── relighting/          # image-based relighting experiments
├── integration/         # Vulkan/CUDA/UE interop for neural rendering
├── paper-implementations/ # implementations of key papers
├── notes/               # reading notes, paper summaries
└── README.md
```

---

## Key Papers

| Paper | Year | Why it matters |
|-------|------|----------------|
| NeRF — Mildenhall et al. | ECCV 2020 | Foundation of neural scene representations |
| Neural Radiance Caching — Müller et al. | SIGGRAPH 2021 | Real-time learned GI |
| InstantNGP — Müller et al. | SIGGRAPH 2022 | Hash encoding, fast training |
| 3D Gaussian Splatting — Kerbl et al. | SIGGRAPH 2023 | Real-time point-based neural rendering |
| SVGF — Schied et al. | SIGGRAPH 2017 | Spatiotemporal variance-guided filtering |
| Physically Based Shading at Disney — Burley | SIGGRAPH 2012 | Foundation for learned material models |

---

## Key Resources

- *Real-Time Rendering, 4th Edition* — neural rendering chapter
- NVIDIA Research publications
- [Neural Rendering course (Tewari et al.)](https://www.neuralrender.com/)
- Papers With Code — Neural Rendering

---

## Status

`[ ]` Not started — requires PyTorch and CUDA foundations first
