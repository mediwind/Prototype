# Technical Review: Phase 19 (Housing & Storage)

## 1. Overview
This document analyzes the performance and scalability of the newly implemented Housing & Storage system (`BuildManager`, `PlaceableObject`, `Chest`). The goal is to identify potential bottlenecks as the game content expands (e.g., thousands of crops, hundreds of chests).

## 2. Scalability Analysis

### ✅ Strengths
- **Dictionary Lookups**: `BuildManager` uses a `Dictionary` keyed by `Vector2i` coordinates (`placed_objects[coords]`). This ensures **O(1)** access time for checking if a tile is occupied, regardless of how many objects exist.
- **Resource Separation**: `PlaceableData` (Resource) separates the "definition" from the "instance," keeping memory usage efficient for shared data (sprites, names).
- **TileMap for Crops**: Crops rely on `TileMap` cells for rendering, which is highly optimized for thousands of instances (Batch Rendering).

### ⚠️ Potential Bottlenecks (Yellow Flags)

#### A. Scene Instantiation Overhead (Loading Lag)
- **Current Logic**: `BuildManager.restore_placed_objects()` iterates through *all* saved objects and calls `.instantiate()` synchronously in a single frame.
- **Risk**: If a player places **500+ objects** (e.g., a massive fence perimeter), the game may freeze for a few seconds when entering the scene.
- **Mitigation**: 
  - Implement **Async Loading**: Process only 10-20 items per frame using `await get_tree().process_frame`.
  - Use **Object Pooling** if objects are destroyed/created frequently (less relevant for persistent buildings).

#### B. Node Limit & Memory (The "Fence" Problem)
- **Current Logic**: Every placed object (even a simple wooden post) is a full `Node2D` scene with a script attached.
- **Risk**: Godot handles nodes well, but having **thousands** of individual script instances can degrade performance (CPU overhead for processing positions/signals).
- **Recommendation**: 
  - For static, non-interactive objects (Fences, Paths, Walls), use **TileMap** instead of `PlaceableObject`.
  - Reserve `PlaceableObject` (Nodes) only for **Interactive** items (Chests, Machines, Workbenches) or complex animated structures.

#### C. Physics Collision
- **Current Logic**: Each placed object has a `StaticBody2D`.
- **Risk**: Thousands of small static bodies can clutter the physics engine (Broadphase checks).
- **Mitigation**: TileMap collisions are much more efficient (merged internally). Again, prefer TileMap for static scaling.

#### D. Save File Size
- **Current Logic**: Data is saved as generic Dictionaries serialized to JSON/Text.
- **Risk**: storing redundant keys (`"id"`, `"amount"`, `"item_id"`) for thousands of slots can bloat the save file (though text compresses well).
- **Mitigation**: Not an immediate concern, but future optimization could use binary serialization (`var_to_bytes`) or a flatter array structure if saves exceed 10MB.

## 3. Conclusion & Recommendations

The current system is **Robust for an MVP** and will easily handle typical gameplay (e.g., 50-100 buildings/chests). 

**Immediate Actions for Phase 20+**:
1.  **Keep using Node-based `PlaceableObject` for Machines/Chests** (Phase 20 Economy requires interaction).
2.  **Use TileMap for Decoration**: If implementing "Fences" or "Floors", integrate them into `TileMap` layers rather than the `BuildManager` node system.
3.  **Monitor Load Times**: If load times exceed 1 second, refactor `restore_placed_objects` to be asynchronous.

**Verdict**: **Safe to Proceed**. No critical "Technical Debt" that prevents future development, provided we don't try to build a city with 10,000 interactive nodes.
