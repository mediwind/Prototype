# 🚜 Devlog: Farming System Implementation (Phase 1 ~ 3)
**Date:** 2026-01-09 (Real Time)
**Author:** AntiGravity Agent
**Tags:** #Farming #System #Godot4 #Refactoring

---

## 📅 Overview
This devlog records the implementation process of the **Farming System**, a core content of the **Neighborvania Project**. It covers Phase 1 (Basics), Phase 2 (Growth), and Phase 3 (Verification & Polish), detailing **tool interaction, grid-based farming, crop growth mechanisms, and visual presentation**.

---

## 🛠️ Feature Implementation

### 1. **Tools & Equipment**
- **Hotbar System:** Implemented functionality to select and equip tools from the hotbar using keyboard keys 1-9.
- **Visual Feedback:** Updated the `PlayerHuman` scene to visually display equipped tools (Hoe, Watering Can, Seeds) at the player's hand (`Marker2D`).
- **InventoryManager:** Added `equip_to_hand()` and `consume_equipped_item()` functions to centrally manage equipment and consumption logic.

### 2. **Interaction Logic**
- **3x3 Grid Limitation:** Introduced a `Chebyshev Distance` check to restrict interactions to a 3x3 tile grid centered on the player.
- **`Town.gd` Controller:**
    - Handled mouse inputs in `_unhandled_input` to branch logic based on the equipped tool.
    - **Hoe:** Changes tiles on `SoilTileMap` to Tilled Soil.
    - **Seed:** Can only be planted on Tilled Soil; creates a crop on `CropTileMap` upon success.
    - **Watering Can:** Waters the crop, satisfying the daily growth condition.

### 3. **Data Structure & Layering**
- **Layer Separation:**
    - `SoilTileMap` (Layer 0): Ground (Grass, Tilled Soil).
    - `CropTileMap` (Layer 1): Crops (Seeds, Sprouts, Mature Crops).
    - **Significance:** Utilized two `TileMapLayer` nodes to allow crops to naturally overlay the soil.
- **FarmManager (Autoload):**
    - Manages crop state using a dictionary with coordinates (`Vector2i`) as keys.
    - Defined `CROP_MAPPING` constants to configure growth stages and coordinates for each crop. Currently uses a hardcoded dictionary approach, planned for migration to **Resource(.tres)** in Phase 4.

### 4. **Growth Mechanism**
- **TimeManager Synchronization:** Syncs with `TimeManager.day_passed` signal to process daily growth logic.
- **Growth Logic:** Growth proceeds only when watered (`watered=true`); updates visual coordinates (`atlas_coords`) upon stage progression.
- **Visual Polish:** Added a random delay (`0.05s ~ 0.2s`) when receiving growth signals in `town.gd` to create an organic "popping" effect for growing crops.

### 5. **Advanced Tile Management**
- **Random Visuals:** Applied randomization when planting seeds to pick between different visual variants (e.g., `(8, 15)` vs `(9, 15)`).
- **Tall Crops (16x32):** Utilized Godot TileSet Editor's **"Size in Atlas"** feature to merge vertical tiles (1x2) for tall crops like Corn.
- **Mapping Refinement:** Implemented `stage_coords` array to accurately map irregular or jumpy TileSet coordinates instead of simple linear calculation.

---

## 📝 Technical Decisions

> **"Composition Over Inheritance"**
> Farming logic is decoupled from the `Player` class and delegated to `Town` (Scene Controller) and `FarmManager` (Data Manager). The Player only provides 'Input' and 'Position', while the Environment and System handle the actual farming logic.

> **"Explicit Code-Based Connection"**
> All signal connections (`hand_equipped`, `day_passed`, `crop_updated`) are established explicitly in GDScript rather than via the Editor interface.

---

## 🚀 Next Steps (Phase 4)
While the system is functionally complete, it lacks data scalability.
1.  **Resource-Driven Data:** Convert `CROP_MAPPING` dictionary into `CropData` resource files for an editor-friendly data management environment.
2.  **Harvest & Regrow:** Implement logic for harvesting mature crops and handling regrowth capability.
3.  **Economy Validation:** Connect harvested crops to sales and the economic loop.

---
*End of This Session Logs*
