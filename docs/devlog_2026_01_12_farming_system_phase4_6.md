# 🚜 Devlog: Farming System Implementation (Phase 4 ~ 6)
**Date:** 2026-01-12 (Real Time)
**Author:** AntiGravity Agent
**Tags:** #Farming #Inventory #System #Godot4 #Debugging

---

## 📅 Overview
This devlog records the completion of the Farming System's core loop, covering **Harvesting, Tool Specifics, and Item Quality**. It details the transition to a Resource-based architecture, the implementation of physical item drops, and a deep dive into the "Phantom Quality" debugging saga that occurred during the inventory refactor.

---

## 🛠️ Feature Implementation

### 1. **Resource-Driven Architecture (Phase 4)**
- **`CropData` Resource:** Replaced the hardcoded `CROP_MAPPING` dictionary with a native `Resource` type.
    - Fields: `seed_coords`, `stage_coords`, `harvest_item`, `min_harvest`, `max_harvest`, `regrow_stage`.
    - **Benefit:** Allows designers (User) to tweak crop stats in the Inspector without touching code.
- **Regrowth Logic:** Implemented logic for crops like Corn to revert to a specific stage (e.g., Stage 3) instead of being removed after harvest.

### 2. **Advanced Harvesting (Phase 5)**
- **Tool Requirements:**
    - **Hand:** Attempts to add the item directly to the inventory. If the inventory is full, it spawns a dropped item.
    - **Scythe:** Forces the item to be spawned as a dropped item (physical bounce effect) regardless of inventory space.
- **Physical Drops (`CollectableObject`):**
    - Created a lightweight scene for items on the ground.
    - Implemented a "Bounce & Float" animation using Tweens to mimic classic RPG loot behavior.
    - Added "Magnetic Pickup" logic when the player walks over them.

### 3. **Item Quality System (Phase 6)**
- **Data Structure:** Extended `SlotData` and `CollectableObject` to carry a `quality` (int) field (0: Normal, 1: Silver, 2: Gold).
- **Probabilistic Drops:** Implemented RNG logic in `Town.gd` for harvest quality (Normal: 80%, Silver: 15%, Gold: 5%).
- **Visuals:** 
    - Added a `QualityStar` icon to the Inventory Slot.
    - **Layout:** Positioned Stars at the **Bottom-Left** and Quantity at the **Bottom-Right** to prevent overlapping.

---

## 🐛 The "Phantom Quality" Incident (Phase 6 Debugging)

During the implementation of the Item Quality system, we encountered a series of complex data persistence bugs.

### 1. The Symptoms
- **Invisible Stars:** Quality data existed but didn't render on load.
- **Ghost Stars:** Moving an item left its star behind in the empty slot.
- **Identity Crisis:** Swapping items swapped their names/counts but NOT their quality (stars stayed put).

### 2. Root Causes & Solutions
- **Blind Reset:** The `item_data` setter in `Slot.gd` effectively wiped quality to 0 whenever an item was assigned.
    - *Fix:* Decoupled quality visual updates from the item setter.
- **Initialization Timing:** `_ready()` processed Icon/Amount but ignored Quality.
    - *Fix:* Added `_update_quality_display` to the initialization sequence.
- **Incomplete Swap Logic:** The Drag & Drop code manually swapped `item_data` and `amount` variables but forgot `quality`.
    - *Fix:* Updated all `_try_merge` and `_try_swap` functions to transactionalize `quality` alongside other data.
- **Cleanup Failure:** Emptying a slot (`item_data = null`) didn't reset `quality`.
    - *Fix:* Added automatic quality reset when item data becomes null.

---

## 📝 Technical Decisions

> **"Event-Driven Visuals"**
> Inventory slots do not update every frame. They only update when receiving a specific signal or when data is explicitly set. This ensures that the overhead of instantiating `AtlasTexture` for quality stars is negligible.

> **"Data Integrity First"**
> The Drag & Drop refactor reinforced the importance of treating "Slot Transfer" as an atomic transaction. A slot is not just an Item, but a container of `{Item, Amount, Quality, Durability?}`. Moving one requires moving all.

---

## 🚀 Next Steps (Phase 7)
With the Farming Loop and Inventory mechanics stabilized, the next phase focuses on **Persistence**.
1.  **Save/Load System:** Serializing the complex state of FarmManager (crops) and InventoryManager (items + quality) to disk.
2.  **Soil Nutrients:** Implementing the Fertilizer system (likely modifying the quality probability logic implemented in Phase 6).

---
*End of This Session Logs*
