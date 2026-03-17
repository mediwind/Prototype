# Devlog: Phase 13 - Farming System Expansion & Tool Refinement
**Date:** 2026-01-22
**Author:** AntiGravity Agent

## 🌟 Overview
In this session, we successfully expanded the farming system by implementing a robust **Tool System**. We moved away from hardcoded logic in `Town.gd` to a data-driven approach using `ToolData` resources and the `EquipmentActionHandler`. Additionally, we refined the distinction between Tools and Weapons to ensure clear gameplay mechanics.

## 🛠️ Key Changes

### 1. Tool Data Architecture (Phase 13)
- **New Resource Type**: Created `ToolData` extending `EquipmentData`.
- **Resources**: Added `.tres` files for:
  - `Hoe` (Tills soil)
  - `Watering Can` (Waters soil)
  - `Scythe` (Harvests crops)
- **Integration**: Updated `EquipmentActionHandler` to recognize `ToolData` and execute specific logic (`_execute_tool`).

### 2. Soil State Management
- **FarmManager Update**: Now tracks `tilled` and `watered` states explicitly in `soil_data`.
- **Town Visuals**: 
  - **Dry Tilled Soil**: Source ID 0, Coords (6, 22).
  - **Wet Tilled Soil**: Source ID 2, Coords (2, 5).
- **Logic**: Planting and fertilizing now work on both dry and wet tilled soil.

### 3. Tool vs. Weapon Refinement (Phase 13.5)
- **Scythe Migration**: Moved `Scythe` from `WeaponData` to `ToolData`.
- **Combat Balance**: All farming tools (Hoe, Scythe) now deal **1 Damage** with **0 Knockback** to enemies, preventing them from being effective combat weapons while still allowing basic interaction.
- **Watering Can**: Added visual-only effect (no hitbox) for better feedback without combat implications.
- **Harvest Restriction**: Restricted crop harvesting to **Scythe only**. Swords can no longer harvest crops.

### 4. Bug Fixes & polish
- **Hoe Combat**: Fixed issue where Hoe wouldn't swing in combat scenes (missing SoilMap).
- **Watering Visuals**: Added visual range indicator for Watering Can.
- **Safety Rules**: Added protocols for editing `.tres` files to prevent corruption.

## 📝 Next Steps
- Expand Crop variety (Potato, Strawberry, etc.).
- Connect Farming to Season System.
- Implement diverse growth visuals (Stages).
