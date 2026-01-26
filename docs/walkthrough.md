# Walkthrough - Phase 8 & 9: Core Refactor & Basic Skills

## Overview
This phase focused on creating a robust foundation for the RPG elements of the game. We refactored the farming growth logic to be more granular, introduced a multi-category leveling system, and implemented the first set of passive farming skills.

## 1. Growth System Refactor (Phase 8)
- **Goal**: Move from simple "day counting" to precise "growth points".
- **Changes**:
    - `FarmManager`: Crops now accumulate ~100 points per day.
    - **SpeedGro**: Now applies a percentage multiplier (e.g., 1.1x) to daily point gain.

## 2. Leveling & Experience (Phase 8)
- **Goal**: Support multiple skills (Farming, Combat, etc.) and a Main Level.
- **Changes**:
    - `LevelAndExpManager`: Now tracks XP per category (Farming, Mining, etc.).
    - **Main Level**: Calculated automatically based on the total levels of all categories.
    - **Debug HUD**: Created `DebugLevelHUD` to visualize and test XP gain instantly.

## 3. Passive Skill System (Phase 9)
- **Goal**: Allow skills to passively buff game mechanics without being on the Action Bar.
- **Implementation**:
    - **Polling Method**: Managers (`FarmManager`, `Town`) now ask `SkillManager.has_skill(id)` to apply bonuses.
    - **Skills Added**:
        - `Fast Grower`: Massively increases crop growth speed (+200% for test).
        - `Master Farmer`: Drastically increases high-quality crop chance (+100% for test).
    - **UI**: Added a specialized **Farming Skill Tree** tab.

## 4. UI Quality of Life
- **Layout**: Adjusted Skill Tree and Action Bar layouts to fit strictly within 640x360 resolution without overlap.
- **Automation**: `SkillButton` now automatically grabs icons from `SkillTemplate`, removing the need for manual assignment.

## Verification
- [x] **Growth**: Crops grow over multiple days (or instantly with Fast Grower).
- [x] **Leveling**: Adding XP increments category level and updates Main Level.
- [x] **Drops**: `Master Farmer` skill successfully forces Gold-quality drops.

# Phase 10: Tools & Interaction Range - Walkthrough

## Summary of Changes
Implemented directional interaction logic for tools (specifically the Scythe) and refactored the physics/collision system to support a unified "Attack/Harvest" mechanism.

### 1. Physics Layer Refactoring
Defined a clear standard for Collision Layers in `project.godot`:
- **Layer 1:** Terrain
- **Layer 2:** Player
- **Layer 3:** Enemy
- **Layer 7:** PlayerHitbox (Attack)
- **Layer 8:** EnemyHurtbox (Damageable Body)
- **Layer 9:** EnemyHitbox (Enemy Attack)
- **Layer 10:** PlayerHurtbox (Damageable Body)
- **Layer 11:** Farming (Crops)

Updated `BasicEnemy` and `BasicBullet` to use these new layers, fixing legacy "Layer 4/32" confusion.

### 2. Hitbox Component Decoupling
Refactored `HitboxComponent` to remove strict dependency on `BaseBullet`.
- **Before:** `if owner is BaseBullet`
- **After:** `if owner.has_method("on_hit")` (Duck Typing)
- **Benefit:** Now Scythe, Sword, Traps, and Bullets can all use the same Hitbox logic.

### 3. Directional Tool Logic (Scythe)
Implemented "Mouse Facing" logic in `PlayerHuman` and `Town.gd`:
- **Use:** Clicking with a Directional Tool (Scythe) turns the player towards the mouse immediately.
- **Effect:** A procedural "Slash" visual (`DebugToolHitVisual`) appears.
- **Dual Detection:** The attack checks for **both**:
    1.  **Farming Layer:** Harvests crops in the arc.
    2.  **Enemy Layer:** Deals damage to generic enemies (via Duck Typing).

## Verification Steps (Manual)

### 1. Physics & Combat Regression Test
- **Action:** Equip a Gun (or Turret) and shoot an Enemy.
- **Expected:** Bullets (Layer 7) should hit Enemy (Layer 8) and deal damage. Verify `BasicBullet` collision settings.

### 2. Scythe Directional Harvest
- **Action:** Equip Scythe. Stand near crops. Click mouse *away* from player (e.g. Right).
- **Expected:**
    - Player sprite flips to face Right.
    - Blue "Slash" visual appears in front of player.
    - Crops in that 3x3 area are harvested.

### 3. Scythe Combat Test
- **Action:** Equip Scythe. Stand near an Enemy. Click.
- **Expected:** Enemy takes damage (Log: "Scythe hit enemy!").

## Regression Fixes (Post-Refactor)
### 1. Item Pickup Restoration
- **Issue:** Items stopped flying to player.
- **Fix:**
    - Player `PickupArea2D`: Assigned to **Layer 6 (Pickup)** (Layer 32).
    - `CollectableObject`: Mask set to **Layer 6**.
    - **Result:** Items now correctly detect player proximity and trigger collection.

### 2. Combat Damage Restoration
- **Issue:** Bullets hit but dealt no damage.
- **Fix:**
    - `BasicEnemy` & `WizardEnemy` Hurtbox: Mask set to **Layer 7 (PlayerHitbox)** (Mask 64).
    - `WizardEnemy` Body: Layer set to **Layer 3 (Enemy)** (Val 4).
    - **Result:** Hurtbox now detects generic `HitboxComponent` (Bullet/Tools) and receives damage via `area_entered`.

### 3. Watering Can Fix
- **Issue:** Unable to water tiles with crops.
- **Fix:**
    - `Town.gd`: `_try_harvest_crop` now filters execution flow.
    - **Result:** If crop is not ripe (harvest fails), input falls through to execute "Watering" logic.

### 4. Turret Attack Fix
- **Issue:** Placed Turrets ignored enemies.
- **Fix:**
    - `Turret` AttackRange: Updated Mask from Layer 4 to **Layer 3 (Enemy)**.
    - **Result:** Turrets now correctly detect Enemy bodies and open fire.

# Walkthrough - Combat System Refactor (Phase 11-12)

## Changes
- **Architecture:** Replaced `ActionController` with `EquipmentActionHandler` (Logic) and `ActionVisualEffect` (Visuals).
- **Data-Driven:** Implemented `WeaponData` resource for easier item creation.
- **Feedback:** Added `FloatingTextSpawner` for universal damage/heal numbers.
- **Enemies:** added `KnockbackComponent` to `BasicEnemy` and `WizardEnemy`.

## Verification Results
### Combat
- [x] Player can swing Sword/Scythe.
- [x] White visual arc appears.
- [x] Enemies take damage and are knocked back.
- [x] Floating damage numbers appear on hit.

### Refactoring
- [x] Renamed `ActionController` to `EquipmentActionHandler`.
- [x] Fixed all `Parse Error` and `Indentation Error` issues.
- [x] `WizardEnemy.tscn` load error resolved.

# Walkthrough - Phase 13: Farming System Expansion

## Overview
This phase focused on finalizing the core farming interactions by integrating **Tools (Hoe, Watering Can)** into the new Action System and establishing a robust "Soil State" logic. We also refined the distinction between Tools and Weapons.

## 1. Tool Data & Architecture
- **Goal**: Standardize Farming Tools using the same system as Weapons (`EquipmentActionHandler`).
- **Implementation**:
    - Created `ToolData` (extends `EquipmentData`) with properties like `ToolType` and `EffectRadius`.
    - Created Resources: `hoe_tool_data.tres`, `watering_can_tool_data.tres`, `scythe_tool_data.tres`.
    - **Refactor**: Moved hardcoded Hoe/Water logic from `Town.gd` into `EquipmentActionHandler`.

## 2. Soil Logic & Visuals
- **Goal**: Accurately track and visualize soil states (Tilled, Watered).
- **FarmManager**:
    - Expanded `soil_data` to track `{ "tilled": true, "watered": false }`.
    - Implemented `till_soil()` and `water_soil()` state machines.
    - Updated `_on_day_passed` to dry out soil daily and require water for crop growth.
- **Town.gd**:
    - `_on_soil_updated`: Now renders distinct Tiles for Dry Tilled (Source 0) and Wet Tilled (Source 2).
    - **Fix**: Allowed planting seeds/fertilizer on **both** Dry and Wet tilled soil.

## 3. Tool vs Weapon Refinement (Phase 13.5)
- **Goal**: Prevent accidental harvesting with Swords and allow generic tool usage in combat without breaking balance.
- **Changes**:
    - **Scythe Migration**: Converted Scythe from `WeaponData` to `ToolData` (Type: SCYTHE).
    - **Harvest Rule**: Only items of type `ToolData` + `SCYTHE` can harvest crops. Swords cannot harvest.
    - **Combat Balance**: All Tools (Hoe, Scythe) now deal **1 Damage / 0 Knockback** to enemies.
    - **Watering Can**: Visual-only effect (no hitbox/damage) in combat/town.
    - **Fix**: Removed dependency on `Town` context for combat, allowing Tools to "swing" (attack) even in the Main combat scene.

## Verification Checklist
- [x] **Tilling**: Hoe transforms Grass -> Dry Tilled Soil.
- [x] **Watering**: Watering Can transforms Dry Tilled -> Wet Tilled Soil.
- [x] **Planting**: Seeds work on both Dry and Wet Tilled Soil.
- [x] **Harvesting**: Only Scythe harvests crops. Sword swings but ignores crops.
- [x] **Combat**: Hoe/Scythe deal 1 damage to enemies. Watering Can shows range but does no damage.

# Walkthrough - Phase 15: System Stabilization (Crafting & Persistence)

## Overview
This phase focused on "connecting the dots" between existing systems. We activated the **Farming Persistence** so crops save/load correctly and built the engine for the **Crafting System** (converting UI skeleton into working logic).

## 1. Farming Persistence (Loose Coupling)
- **Problem**: Crops disappeared after reloading or switching scenes.
- **Solution**:
    - **FarmManager**: Implemented `get_save_data()` and `load_save_data()`.
    - **Lazy Loading**: Added protection against race conditions where data loaded before the `crop_registry` was built.
    - **Town.gd**: Added `_refresh_all_visuals()` to force-render saved crops upon entering the scene.
    - **Result**: Crops now persist across Game Days and Scene changes.

## 2. Crafting System Implementation
- **Problem**: The UI existed, but the "Craft" button did nothing.
- **Solution**:
    - **InventoryManager**: Added `has_item()`, `consume_item()`, and `can_add_item()` methods.
    - **Hotbar Support**: Fixed `add_item` to correctly fill empty Hotbar slots if the main Inventory is full.
    - **CraftingUI**:
        - Replaced `Slot` with lightweight `DisplaySlot` to prevent drag-drop bugs.
        - Connected "Craft" button to actual resource consumption logic.
        - Implemented "Full Inventory" check to disable crafting when no space exists.

## Verification
- [x] **Persistence**: Planted Corn -> Went to Battle -> Returned -> Corn is still there.
- [x] **Time Flow**: Time passes correctly while away from Town (Log confirmation).
- [x] **Crafting**: Can craft items (Test Recipe). Ingredients are consumed.
- [x] **Edge Case**: Crafting is disabled if Inventory & Hotbar are full.


# Walkthrough - Phase 16: Gathering & Unified Drop System

## Overview
This phase implemented the Gathering System (Trees/Rocks) and established a **Unified Drop System** to handle loot generation flexibly across both resources and enemies.

## 1. Unified Drop System (Architecture)
- **Goal**: Flexible loot tables (e.g., Tree -> Wood, Rock -> Stone + Rare Copper).
- **Solution**:
    - Created `DropData` (Resource): Defines Item, Chance, and Amount range.
    - Created `ItemDropComponent` (Node): Holds a list of `DropData` and handles spawning logic.
    - **Benefit**: Can be attached to *any* object (Enemy, Chest, Resource) to spawn items.

## 2. Resources & Tools
- **GatherableObject**:
    - Refactored to use `ItemDropComponent` instead of hardcoded export variables.
    - Integrated with `EquipmentActionHandler` for tool interaction.
- **Tools**:
    - Implemented `Axe` (Chops Wood) and `Pickaxe` (Mines Stone).
    - Added `efficiency` to `ToolData` (defines damage to resources).

## Verification
- [x] **Tree**: Chops with Axe. Drops Wood (100%).
- [x] **Rock**: Mines with Pickaxe. Drops Stone (100%) and Copper Ore (20%).
- [x] **Logic**: Wrong tool usage deflects (does no damage).
- [x] **Persistence**: Resource scenes are correctly configured with new components.

# Walkthrough - Phase 17: Robust Persistence (ID System)

## Overview
Replaced the fragile "File Path Separation" persistence model with a robust **ID-based System**. This prevents save file corruption when moving or renaming item resources.

## 1. Architecture: Item Database
- **Problem**: Saving `res://path/to/item.tres` breaks if the file moves.
- **Solution**:
    - **IDs**: Added `id` (String) to `ItemData`.
    - **Database**: Created `ItemDatabase` (Autoload) to scan and map IDs to Resources at startup.
    - **Inventory**: `SlotData` now saves `saved_item_id` (String) instead of the Resource itself.

## 2. Serialization Workflow
- **Save**:
    1.  `SaveManager` calls `inventory_data.prepare_serialization()`.
    2.  Inventory syncs `item_data.id` -> `saved_item_id`.
    3.  `ResourceSaver` writes the String ID to disk.
- **Load**:
    1.  `SaveManager` loads the file (getting String IDs).
    2.  `SaveManager` calls `inventory_data.restore_item_references()`.
    3.  Inventory looks up `saved_item_id` in `ItemDatabase` and restores `item_data`.

## 3. Race Condition Fix
- **Issue**: `SaveManager` loaded before `ItemDatabase` was ready, causing restoration to fail (Empty Inventory).
- **Fix**: Reordered `project.godot` Autoloads to ensure `ItemDatabase` initializes first.

## Verification
- [x] **Resource Migration**: All items and crops have unique IDs (`wood`, `corn_seed`, etc.).
- [x] **Saving**: Logs confirm `SavedID` is populated correctly.
- [x] **Loading**: Autoload reordering ensures data is restored.
- [x] **Persistence**: Inventory survives Game Restart.

## Phase 19: Housing & Storage System (2026-01-22)
- **Architecture**: Implemented `PlaceableData` and `PlaceableObject` for generic building.
- **Components**:
    - **BuildManager**: Decoupled from generic scenes; handles generic placement and persistence.
    - **Chest**: First furniture item with custom `InventoryData`, accessible via interaction.
    - **UI**: Refactored `Slot.gd` to work with any `InventoryData` owner (not just global player). Created `ChestUI`.
- **Fixes**:
    - **Y-Sort**: Fixed player rendering behind trees/objects by reparenting all world entities to a Y-Sort enabled `Entities` node in `Town.tscn`.
    - **Cyclic Dependency**: Resolved class registration issues between `PlaceableObject` and `BuildManager`.
- **Content**: Added "Wooden Chest" crafting recipe. Only recipe definition added, needs "Furniture" tab in Crafting UI to be fully accessible? (Recipe category needs check).

## Phase 19.5: Post-Implementation Fixes
- **Ghost Item Glitch**: Fixed an issue where the player's hand didn't update when moving or swapping items in the inventory.
    - **Logic**: Added checks in `Slot.gd` and `InventoryManager.gd` to refresh the hand if the active hotbar slot is modified.
- **Persistence**: Fixed `Chest` inventory not saving correctly when switching scenes (`_exit_tree` sync added).
- **Transient Objects**: Fixed Turrets (and other combat buildables) incorrectly saving to the Town file.
