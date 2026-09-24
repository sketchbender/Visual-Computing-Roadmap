# Unreal Engine

Real-time rendering and game development using Unreal Engine 5 with C++.

The focus is on **rendering and GPU programming inside Unreal**, not gameplay scripting.

---

## Focus Areas

- **Rendering Pipeline Internals** — deferred renderer, scene proxy, draw policies
- **Custom Materials & Shaders** — material expressions, custom HLSL nodes, USF files
- **C++ Gameplay Framework** — actors, components, subsystems (as needed for rendering work)
- **Nanite** — virtualized geometry, GPU-driven rendering
- **Lumen** — global illumination, software/hardware ray tracing
- **NNE (Neural Network Engine)** — ONNX model runtime, TensorRT backend
- **Compute Shaders in UE** — RDG (Render Dependency Graph), custom compute passes
- **Post-Processing** — custom post-process materials, scene view extensions

---

## Structure

```text
unreal/
├── basics/              # project setup, actor spawning, C++ fundamentals in UE
├── materials/           # custom materials, shader graphs, HLSL in UE
├── rendering/           # render pipeline experiments, custom passes
├── compute/             # compute shaders via RDG
├── nne/                 # Neural Network Engine experiments
├── mini-projects/       # standalone UE projects (rendering-focused)
├── notes/               # learning notes, UE architecture diagrams
└── README.md
```

---

## Key Resources

- Tom Looman — Unreal Engine C++
- Unreal Engine Documentation (Rendering section)
- *Game Engine Architecture* — Jason Gregory
- Epic Games GDC/SIGGRAPH presentations

---

## Status

`[ ]` In progress — basic C++ actor spawning done, no rendering work yet
