# Phase 13.5: Tool & Weapon Refinement Implementation Plan

## Goal Description
Refine the distinction between Farming Tools and Combat Weapons. Specifically, migrate the **Scythe** to be primarily a Farming Tool (while retaining weak combat capabilities), impose combat penalties on all tools (Hoe, Watering Can, Scythe), and restrict harvesting mechanics so that true Weapons (Sword) cannot accidentally harvest crops.

## User Review Required
> [!IMPORTANT]
> **Scythe Migration**: The Scythe will no longer use `WeaponData`. It will use `ToolData` extended with combat parameters (or handled internally via specific logic).
> **Decision**: To avoid multiple inheritance issues, `ToolData` will support basic combat stats (damage, knockback) but default to weak values. Alternatively, `ActionHandler` will apply fixed weak stats for any `ToolData` item.
> **Chosen Approach**: `ToolData` will have optional `can_harvest_crops` (bool) and `combat_stats` (Dictionary or fixed logic). Actually, `ToolType` enum expansion is cleaner. We will add `SCYTHE` to `ToolType` in `ToolData`.

## Proposed Changes

### Data & Resources
#### [MODIFY] [tool_data.gd](file:///d:/Godot/Prototype/resources/item/tool_data.gd)
- Update `ToolType` enum: Add `SCYTHE`.
- Add export vars for simple combat traits (optional, or hardcoded in handler for tools):
  - `damage`: float = 1.0
  - `knockback_force`: float = 0.0

#### [MODIFY] [scythe.tres](file:///d:/Godot/Prototype/resources/item/scythe.tres)
- Replace `equipment_data` (currently `ScytheWeaponData.tres`) with a new `ScytheToolData.tres`.

#### [NEW] [scythe_tool_data.tres]
- Create new resource using `ToolData`.
- Type: `SCYTHE`.
- Stats: Damage 1.0, Knockback 0.0.

### System Logic
#### [MODIFY] [equipment_action_handler.gd](file:///d:/Godot/Prototype/scenes/component/equipment_action_handler.gd)
- **Tool Logic (`_execute_tool`)**:
  - Add case for `ToolType.SCYTHE`.
  - Scythe Logic: Uses **Directional/Arc** logic (unlike Point-click Hoe/Water).
  - *Challenge*: Scythe needs "Swing" visual and "Area" hit detection like a weapon.
  - *Solution*: Move the common "Swing & Hit" logic to a shared helper or allow `ToolData` to trigger `_execute_melee` logic but with "Tool Mode" flag?
  - *Refined Plan*:
    - In `_execute_tool`, if type is SCYTHE:
      - Call `_execute_melee` (reused) but pass a constructed "Pseudo-WeaponData" or modify `_execute_melee` to accept `EquipmentData`.
      - **Better**: Update `_execute_melee` to take `damage` and `knockback` as direct arguments, or `EquipmentData` + overrides.
- **Harvest Logic (`_apply_hit`)**:
  - Current: `_try_harvest_crop` is called if `Town` detects a melee hit.
  - New: `Town.gd`'s `_check_farming_hit` needs to check if the *Item* used was actually a proper Harvesting Tool (Scythe).
  - Pass the source `ItemData` or `EquipmentData` into the result dictionary of `attempt_action`.
  - In `Town.gd`, check: `if item.tool_data.tool_type == SCYTHE: harvest()`.

#### [MODIFY] [town.gd](file:///d:/Godot/Prototype/scenes/town/town.gd)
- In `_check_farming_hit`, retrieve the item that caused the hit.
- Check if it is a `ToolData` AND type is `SCYTHE`.
- If it is a `WeaponData` (Sword), **SKIP** harvest logic.

## Verification Plan

### Manual Verification
1. **Scythe Combat**:
   - Equip Scythe -> Attack Enemy.
   - Result: Damage = 1, Knockback = 0 (Enemy doesn't fly back).
2. **Scythe Harvest**:
   - Equip Scythe -> Swing at Crop.
   - Result: Crop harvested.
3. **Sword Harvest**:
   - Equip Sword -> Swing at Crop.
   - Result: Crop **NOT** harvested.
4. **Sword Combat**:
   - Equip Sword -> Attack Enemy.
   - Result: Normal Damage (5+), Knockback applied.
