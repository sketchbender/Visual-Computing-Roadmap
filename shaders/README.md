# Shader Programming

Unified shader programming workspace covering **HLSL** and **Slang**.

HLSL is the primary shader language for DirectX and compiles to SPIR-V via DXC for Vulkan.  
Slang is a modern shader language with first-class support for differentiable programming and modern GPU features.

---

## Focus Areas

### HLSL
- **Vertex & Pixel Shaders** — transformations, lighting, texturing
- **Compute Shaders** — general-purpose GPU compute via HLSL
- **PBR Lighting** — physically based BRDF implementations
- **Ray Tracing Shaders** — ray generation, closest hit, miss shaders
- **Cooperative Vectors** — neural shading via HLSL cooperative vector extensions
- **SPIR-V Compilation** — DXC workflow for Vulkan targets

### Slang
- **Modern Shader Syntax** — modules, generics, interfaces
- **Differentiable Programming** — auto-diff for learned shading
- **Cross-Platform Compilation** — SPIR-V, DXIL, CUDA output
- **Integration** — Slang with Vulkan and custom renderers

---

## Structure

```text
shaders/
├── hlsl/
│   ├── basics/          # vertex/pixel shader fundamentals
│   ├── lighting/        # PBR, Blinn-Phong, custom BRDFs
│   ├── compute/         # compute shader experiments
│   ├── raytracing/      # DXR / Vulkan RT shaders
│   └── advanced/        # cooperative vectors, neural shading
├── slang/
│   ├── basics/          # Slang syntax, modules, generics
│   ├── differentiable/  # auto-diff shader experiments
│   └── integration/     # Slang + Vulkan pipeline experiments
├── shared/              # common utilities, math helpers, shared includes
├── notes/               # learning notes, HLSL vs Slang comparisons
└── README.md
```

---

## Key Resources

- [Microsoft HLSL Documentation](https://learn.microsoft.com/en-us/windows/win32/direct3dhlsl/dx-graphics-hlsl)
- [Slang Language](https://shader-slang.com/)
- *Real-Time Rendering, 4th Edition* — shader chapters
- NVIDIA Cooperative Vectors documentation

---

## Status

`[ ]` In progress — Slang experience exists, HLSL starting fresh
