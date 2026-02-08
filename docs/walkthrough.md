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

# Walkthrough - Phase 20: System Infrastructure & Scene Flow

## Overview
This phase established the core game loop elements: **Scene Management**, **Time & Persistence**, and **System UIs**. We addressed critical bugs related to "Phantom Saves" (data not clearing on new game) and integrated all major systems (Time, Currency, Levels) into the save architecture.

## 1. System Infrastructure
- **SceneManager** (Autoload):
    - Implemented `change_scene(path)` with a black fade transition to smooth out loading.
    - Replaced hardcoded `get_tree().change_scene` calls in `TitleScreen` and `BattleEntrance`.
- **SystemMenu**:
    - Created a Pause Menu (ESC) containing "Resume", "Save", "Load", "Main Menu", "Quit".
    - **Logic**: Pause menu now properly intercepts input to prevent double-pausing or UI conflict.

## 2. Persistence & Data Integrity (Critical Fixes)
- **Problem**: Starting a "New Game" often carried over previous state (Phantom Saves), and Time/Levels weren't saving.
- **Solution (Architecture)**:
    - **TimeManager**: Connected to `GameData` (`time_save_data`). Now saves Year/Season/Day/Hour.
    - **LevelAndExpManager**: Connected to `GameData`. Now saves Main Level/Skill Levels properly.
    - **CurrencyManager**: Connected to `GameData`. Gold/Faith/Soul now persist and reset correctly.
    - **Phantom Fix**: 
        1. Removed `Town._ready` auto-save.
        2. Implemented `CACHE_MODE_REPLACE` in `SaveManager` to force clean reload from disk.
        3. Ensured `New Game` triggers `reset_time()` and clears all manager states.

## 3. Game Loop & UX Refinements
- **In-Game Load**:
    - Fixed "Load" button doing nothing visible. Now forces a scene reload to `Town.tscn` to reflect loaded data.
- **Battle Restriction**:
    - "Save" button is **Disabled** in Combat scenes ("No Save in Battle") to prevent soft-locks.
- **Main Level Logic**:
    - Adjusted formula to start at **Level 1** (instead of 3) by normalizing the base level count. `(Sum - Count)/2 + 1`.

## Verification
- [x] **Scene Flow**: Title -> Town -> Battle -> Town works with Fade.
- [x] **Persistence**: Save in Town -> Exit -> Continue works. Time and Money are restored.
- [x] **New Game**: Cleanly resets Time (Year 1 Spring 1 06:00), Money (0), and Levels (1).

# Walkthrough - Phase 21: World Expansion & Interiors

## Overview
This phase introduced the scalable **World System** required to expand beyond the initial Town scene. We implemented a data-driven Portal system, variable time flow for interiors, and the first interior scene (`PlayerHome`).

## 1. Core World Systems
- **Portal & SpawnPoint**:
    - **SpawnPoint**: Validated marker for precise player positioning (using `spawn_id`).
### Phase 21.5: QA & Critical Bug Fixes (Session #2)
**Date:** 2026-01-30

Following the Phase 21 implementation, a rigorous QA session revealed several critical issues which have now been resolved.

#### 🐛 Bugs Fixed
1.  **Ghost Object Persistence**: Objects placed in Town appeared in Home (and vice versa) because `BuildManager` stored data globally.
    *   **Fix**: Refactored `BuildManager` to store placed objects in a nested dictionary keyed by `scene_file_path`.
2.  **Save Data Corruption**: Saving the game corrupted item IDs of placed objects, causing a crash on load.
    *   **Fix**: Modified `BuildManager.get_save_data` to safely update `custom_data` without overwriting the object's identity metadata.
3.  **Indoor Interaction Failure**: Players could not open chests indoors.
    *   **Fix**: Ported `Town.gd` interaction logic to `PlayerHome.gd`, including parent-node checking (since Colliders are children of the actual Object) and added `_open_container_ui`.
4.  **Entrance Glitch**: Loading a game caused a visual "pop" as the player moved after the screen faded in.
    *   **Fix**: Updated `SceneManager` to accept an `override_position` and apply it *during* the black screen transition.

#### 🏠 PlayerHome Architecture
*   **TileMapLayer**: Added to `PlayerHome` to serve as the "Grid" for snapping furniture. It uses `farming_tileset.tres`.
*   **UI Integration**: Manually added `TownUI`, `InventoryUI`, and `SkillTreeUI` to the scene to ensure functionality indoors.
*   **Placeholder Art**: Used `ColorRect` for background (verify mouse_filter=Ignore to allow clicking through it).
- **Logic**: `SceneManager` now accepts a `spawn_tag` to teleport the player to the matching `SpawnPoint` after scene load.
- **Variable Time Flow**:
    - **TimeManager**: Added `calendar_time_multiplier`.
    - **Implementation**: `PlayerHome` sets this to `0.0` on entry (pausing day cycle) and `Town` resets it to `1.0` (resuming day cycle). This fulfills the requirement to pause time indoors or in specific missions.
- **Persistence Integrity**:
    - **Location Saving**: `GameData` now stores `current_scene_path` and `player_position`.
    - **Restore Logic**: Loading a game now restores the player exactly where they saved, even inside buildings.

## 2. Content: Player Home
- **Exterior**: Created `HouseExterior` using Region-enabled Sprite to display a cottage in `Town.tscn`. Integrated a Portal at the door.
- **Interior**: Created `PlayerHome.tscn`.
    - Functioning **Exit Portal** back to Town.
    - Visual feedback ("Time Paused") verifies the time dilation system.

## Verification
- [x] **Travel**: Portal from Town -> Home -> Home Entry Point works.
- [x] **Return**: Portal from Home -> Town -> Outside Door works.
- [x] **Time**: Logs confirm Time Scale = 0.0 Indoors, 1.0 Outdoors.
- [x] **Persistence**: Saving inside the house and reloading keeps the player inside the house.


# Walkthrough - Phase 22: UI Architecture Refactoring (2026-01-31)

## Overview
This phase addressed the technical debt of "Copy-Paste UI" by implementing a proper **Persistent UI Layer**. We centralized UI logic into a new `UIManager` and created a single `GameUI` scene that persists across scene changes, cleaning up the mess of `TownUI` being duplicated everywhere.

## 1. Architecture: Persistent UI
- **GameUI Scene**: A new `CanvasLayer` that sits above the game world `SubViewport` (or simplified layer stack).
    - Contains: `HUD` (Action Bar, Currency), `Windows` (Inventory, Skills), `SystemMenu`.
    - **Benefit**: No need to add UI nodes to every new scene (Town, Home, Dungeon).
- **UIManager (Autoload)**:
    - Automatically instantiates `GameUI` at startup.
    - Manages global input for UI toggles (`I` for Inventory, `K` for Skills, `Esc` for Menu).
    - Exposes generic methods like `open_container_ui(data)` so game objects don't need to know about UI scenes.

## 2. Refactoring & Cleanup
- **Deleted Code**: Removed ~50 lines of duplicate UI connection code from `Town.gd` and `PlayerHome.gd`.
- **Migration**:
    - **Interaction**: Objects now call `UIManager.open_container_ui()` instead of local scene functions.
    - **TownUI**: This node is now obsolete. The components (Action Bar, Currency) are now part of `GameUI`.

## Verification Steps (Manual)
1.  **Cleanup**: Manually delete the `TownUI` node from `Town.tscn` and `PlayerHome.tscn`.
2.  **Play**: Run the game.
    - **HUD**: Verify Action Bar and Money appear globally.
    - **Windows**: Verify `I` and `K` keys open windows.
    - **Travel**: Go to Player Home. Verify UI does not blink or disappear/duplicate.
    - **Interaction**: Open the Chest. Verify it works via `UIManager`.

# Walkthrough - Phase 23: Building System Architecture Refactor

## Overview
This phase refactored the legacy `BuildManager` to be a pure "Placement Agent", decoupling it from cost management (items, mana, etc.). This prepares the system for future expansions like Skills, Traps, and NPC construction.

## 1. Architecture: Callback-based System
- **BuildManager**: Removed all item consumption logic. Added `callbacks` parameter to `start_placing`.
- **Client Responsibility**: `Town.gd` and `PlayerHome.gd` now pass an `on_success` callback that handles inventory consumption.
- **Benefit**: `BuildManager` no longer needs to know *what* is paying for the building (Item? Gold? Mana? Free?).

## 2. Debug Feature: Magic Construction
- **Feature**: Pressing `T` in Town activates "Magic Construction Mode".
- **Implementation**: Uses `BuildManager` with an empty callback dictionary `{}`.
- **Result**: Places a temporary Chest (Visual only) without consuming items. Demonstrates the "Free Build" capability.

## 3. Bug Fixes (QA)
- **Inventory Drag**: Fixed a regression where `InventoryUI`'s nested `CanvasLayer` (Layer 1) was blocked by the parent `GameUI` (Layer 100). Removed the nested layer to fix input priority.
- **Scene Transition**: Fixed a crash (`get_viewport() is null`) in `BuildManager.gd` by validating the `tilemap` reference in `_process`.

## 4. Documentation
- **Manual**: Created `docs/building_system_manual.md` as a definitive guide for future agents on how to use the new system.


# Walkthrough - Phase 24: NPC & Dialogue System

## Overview
Implemented the **Dialogue Manager** plugin (Nathan Hoad) to power the "Social Metroidvania" aspect. Created a custom "Bottom Rectangle + Portrait" UI (`CustomBalloon`) and the first NPC, **Talula**. interactions allow conditional branching (Item Check) and state mutation (Affection).

## 1. System Architecture
- **Dialogue Manager**: Installed v3.3.0 to `addons/`, enabled in settings. Fixed Godot 4.4 API compatibility in `editor_translation_parser_plugin.gd`.
- **NPCManager**: Created (`scenes/manager/npc_manager.gd`) and registered as Autoload. Handles global NPC state (Affection).
- **Custom UI**: Built `custom_balloon.tscn` using `CanvasLayer`.
    - Supports Portraits via Tags (`Talula (happy): ...`).
    - Uses `RichTextLabel` with Typewriter effect.
    - Handled Input ('Space' / Click) to skip or advance.

## 2. Content: Talula
- **Dialogue**: `resources/dialogue/talula.dialogue`
    - Logic: Checks if player has "Wood". If so, offers a "Gift" option.
    - Effect: Consumes wood, increases Affection (+10).
- **Scene**: `scenes/npc/talula.tscn` (Area2D).
    - Detects player vicinity.
    - Listens for new "interact" Action (Key E).

## 3. Integration
- **Input Map**: Added `interact` (E) to Project Settings.
- **Town**: Spawned Talula instance at `(300, 200)` via code in `_ready()` for immediate testing.

## Verification

### UI Polish (Post-Verification)
- **Dialogue Pacing**: Added mandatory Input Cooldown (0.1s) and removed auto-advance to ensure players don't accidental skip text.
- **HUD Visibility**: 
    - Fixed `Town` scene to explicitly show HUD on load (robust F6 testing).
    - Fixed `TitleScreen` to explicitly hide HUD.
    - Implemented "Cinematic Mode": HUD automatically hides when **Dialogue** or **System Menu** (ESC) is active to prevent overlap.

## Phase 25: Save/Load Integration (Social)
**Goal**: Integrate `NPCManager` with the persistence system to ensure social progress is saved.

### Implementation
- **Data Architecture**: Added `npc_save_data` dictionary to `GameData` resource.
- **Save Flow**: `SaveManager` now pulls data from `NPCManager.get_save_data()` during save.
- **Load Flow**: `SaveManager` pushes data to `NPCManager.load_save_data()` during load.
- **Robustness**: Added specific logic to reset NPC state on `New Game`.

### Verification (QA Passed)
- **Session Persistence**: Confirmed Affection (10 -> 20) persists after restart.
- **Clean New Game**: Confirmed Affection resets to 0 on New Game.
- **Phantom Data**: Confirmed unsaved progress (10 -> 20) is correctly rolled back to 10 if quit without saving.
- **Bug Fix**: Fixed a regression where closing the System Menu (ESC) would accidentally force-show the HUD even if Dialogue was active. Implemented `is_dialogue_active` state in `UIManager` to solve this.


# Walkthrough - Phase 26: NPC Scheduling & Time Integration

## Overview
Implemented the **Daily Schedule System** for NPCs, allowing them to move between different locations (Plaza, Home) based on the in-game clock. This phase moved from static NPCs to living actors.

## 1. Core Architecture
- **TimeManager (Integration)**:
    - Connected `NPCSchedulerComponent` to the `hour_passed` signal.
    - Verified `TimeManager` works correctly outdoors (1.0x scale).
- **NPC Components**:
    - `NPCIdentity` (Resource): Acts as a "Data Container" linking Name, Portrait, and Schedule.
    - `ScheduleDef` (Resource): Maps `hour (int)` -> `activity_id (string)`.
    - `NPCSchedulerComponent`: Decides *where* to go.
    - `NPCMovementComponent`: Decides *how* to get there (currently `move_toward` linear movement).

## 2. Town Scene Refactor
- **Initial Setup**: Initially tested with dynamic code generation in `Town.gd`.
- **Refactor**: Replaced hardcoded logic with a **Scene-Based Marker System**.
    - Added `MarkerPlaza` and `MarkerHome` nodes directly to `Town.tscn`.
    - `Town.gd` now simply assigns these existing nodes to the NPC.

## 3. Polish & UX
- **GameUI**: Added a **Time Display** (Clock) to the top-right HUD (`Y1 Spring 01 06:00`).
- **Manual**: Created `docs/manual_npc_scheduling_kr.md` to guide future content creation.

## Verification
- [x] **Scheduling**: Talula moves to Plaza at 06:00 and Home at 18:00.
- [x] **Persistence**: Schedule resumes correctly after save/load.
- [x] **Collision**: NPC moves linearly but respects physics (stops at rocks), which is acceptable for now.

# Walkthrough - Phase 27: Scalability & Interaction Polish

## Overview
This phase focused on "Scalability" (handling multiple NPCs) and "Polishing Interaction" (robustness against missing data). We moved from a hardcoded NPC setup to a dynamic discovery system.

## 1. Scalability: Location Registration System
- **Problem**: `Town.gd` required hardcoded lines for every new NPC (`talula.schedule=...`).
- **Solution**:
    - **Auto-Discovery**: `Town.gd` now scans for markers starting with `Marker` (e.g., `MarkerPlaza`) and creates a location map.
    - **Auto-Distribution**: Iterate all children, find NPCs, and inject the location map.
    - **Result**: New NPCs work instantly by just placing them in the scene.

## 2. Interaction Polish
- **Resume Movement**: Connected `DialogueManager.dialogue_ended` to `force_update_schedule`. NPCs now resume walking after chatting.
- **Safety Guard**: `interact()` now checks if `dialogue_resource` exists. Prevents crashes for "Ambient NPCs" (like Gobo).
- **Editor UX**: Added explicit typing to `ScheduleDef` Dictionary (`Dictionary[int, String]`) to fix Godot Inspector "Null Key" issues.

## 3. Bug Fixes
- **Reference Bug**: Fixed issue where `Town.gd` replaced the NPC's destination dictionary, but the `NPCSchedulerComponent` held a stale reference to the old one.
- **Refactor**: Renamed `Talula.gd` to `NPC.gd` to officialize it as the generic script.

## Verification
- [x] **Gobo**: New NPC created by user works perfectly without code changes.
- [x] **Resume**: Dialogue pauses NPC; closing checks schedule and resumes movement.
- [x] **Resume**: Dialogue pauses NPC; closing checks schedule and resumes movement.
- [x] **Safety**: Clicking Gobo (no dialogue) logs message but does not crash.

# Walkthrough - Phase 28: NPC Persistence & Consistency

## Overview
This phase solved the "Teleporting NPC" immersion breaker. We implemented a system to save the exact location of every NPC, ensuring that when you load the game, everyone is exactly where you left them—even if they were in the middle of a field.

## 1. State Tracking (NPCManager)
- **New Data**: `npc_states` dictionary stores `{ scene_path, position }` for each NPC ID.
- **Live Tracking**: `NPCManager` now maintains an `active_npcs` list to query positions in real-time during `save_game()`, rather than relying on stale data.

## 2. Save/Load Logic
- **Exit Logic**: When an NPC is removed (scene change), it reports its final position to `NPCManager`.
- **Spawn Logic**: When an NPC is created (`_ready`), it asks `NPCManager` for its last known position and teleports there.
- **The "Pause Menu" Bug Fix**:
    - *Problem*: Loading a game while playing caused the *current* NPC position (dying scene) to overwrite the *loaded* data (safe file).
    - *Solution*: Added `SaveManager.is_loading_state` flag. NPCs are forbidden from saving their state if the game is currently in "Loading Mode".

## Verification
- [x] **Roadside Save**: Saved while Talula was walking. Loaded game. Talula resumed walking from that exact spot.
- [x] **Inventory Sync**: Verified that NPC positions and Player Inventory are consistently saved/loaded together.
- [x] **Pause Menu Load**: Loading from ESC menu correctly resets the world state without data contamination.

# Walkthrough - Phase 29: Advanced Dialogue & Social Interaction

## Overview
Implemented the **Dialogue Manager** plugin to power conditional, branching conversations. This system allows NPCs to react to player inventory, quest state, and affection levels.

## 1. Core Integrations
- **Action Integration**: Added `is_dialogue_active` check to `ActionController` (via `UIManager`) to prevent attacking while talking.
- **Cinematic Mode**: HUD automatically hides when dialogue begins.
- **Safety**: Added checks to prevent interactions with NPCs who have no dialogue resource assigned.

## 2. Content
- **Talula**: Added "First Meeting" dialogue that triggers only once (`has_met_talula` memory).
- **Conditional Logic**: Added syntax support for `if QuestManager.is_quest_active(...)` directly in dialogue files.

## Verification
- [x] **First Meeting**: Talula says "Hello Stranger" once, then "Welcome back" afterwards.
- [x] **Conditions**: Dialogue changes properly based on Inventory items.

# Walkthrough - Phase 30: Data-Driven Quest System

## Overview
Designed and implemented a scalable, inspector-based Quest System. Quests are now `.tres` resources, not hardcoded scripts.

## 1. Architecture
- **QuestResource**: Holds static data (ID, Title, Objectives, Rewards).
- **QuestManager**: Autoload that manages runtime state (`active_quests`, `completed_quests`).
- **QuestObjective**: Modular class for different objective types (Fetch, Talk).

## 2. Integration
- **NPCManager**: Connected quest completion to Affection gains.
- **InventoryManager**: Connected `FetchObjective` to check and consume items.

## Verification
- [x] **Start**: Quest appears in `QuestManager.active_quests`.
- [x] **Objective**: Collecting items updates the objective progress.
- [x] **Complete**: Turning in quest moves it to `completed_quests` and grants rewards.

# Walkthrough - Phase 31: Quest UI & UX Polish

## Overview
Refined the raw Quest Log UI into a polished, two-pane interface with responsive layout and proper categorization. Addressed critical stability issues involving scene corruption and initialization order.

## 1. UI Layout & UX
- **Two-Pane Design**:
    - **Left**: Quest List (Active & Completed), unified scroll.
    - **Right**: Details (Title, Desc, Objectives).
- **Categorization**: Added "Miscellaneous" grouping to declutter the main list.
- **Responsiveness**: Used percentage-based anchors (5% margins) for proper scaling.
- **Polish**: Clean empty states, "Select a quest..." prompts, and improved font sizes.

## 2. Localization Improvements
- **Text Wrapping**: Enabled `autowrap_mode = 3 (Word Smart)` for better Korean text handling, though manual line breaks are still recommended for perfect formatting.

## 3. Critical Bug Fixes (Stability)
- **Scene Corruption**:
    - *Issue*: `quest_log_ui.tscn` became flattened and lost `unique_name_in_owner` properties due to manual text editing.
    - *Fix*: Completely rewrote the `.tscn` file structure and restored unique names. Added "Scene File Safety" rule to project constitution.
- **Race Condition (Initialization)**:
    - *Issue*: `SaveManager` loaded data before `QuestManager` scanned the quest database, causing "Quest ID not found" errors on startup.
    - *Fix*: Implemented lazy-loading in `QuestManager.load_save_data()` to ensure the database is ready before applying save data.

## Verification
- [x] **Layout**: UI scales correctly; lists scroll properly.
- [x] **Logic**: Active/Completed quests separate correctly; Misc quests group together.
- [x] **Stability**: Game loads clean (F5) without red errors.
- [x] **Persistence**: Quest state survives save/load and scene changes.

# Walkthrough - Phase 32: System Documentation & Handover

## Overview
Formalized the project knowledge into comprehensive guides to facilitate future development.

## 1. Created Documents
- **Narrative & Quest Guide**: Combined manual for writing Dialogue (DSL) and creating Quests (Resources).
- **README.md**: Updated project status and feature list.
- **Rules Update**: Added "Friendly Communication" and "Scene File Safety" protocols.

## 2. Handover Status
- All core systems (Farming, Building, Combat, Social, Quests) are functional and documented.
- Project is ready for Content Expansion phase.

