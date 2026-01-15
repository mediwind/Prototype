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
