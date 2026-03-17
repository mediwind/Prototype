# DevLog: Action Bar Implementation & Debugging
**Date**: 2025-12-27
**Topic**: Advanced Action Bar Features (Drag & Drop, Cooldowns, Reset Logic)

## 1. Overview
The goal was to implement a fully functional Action Bar for the RPG Prototype. This involved connecting the existing `SkillTree` to a new `ActionBar` UI, allowing users to equip unlocked skills, visualize cooldowns, and manage skill points.

## 2. Architecture Changes
### SkillManager (Autoload)
- **Role**: acting as the "Source of Truth" for skill state.
- **New Features**:
    - `skill_cooldowns`: Dictionary to track cooldown end-times.
    - `reset_skills()`: Logic to refund points and clear data.
    - `equip_skill()`: Enhanced to support **Swapping** and **Unique Equipping** (prevent duplicates).

### SkillButton (UI)
- **Dual Mode**: Refactored to handle two distinct behaviors:
    - **Mode.TREE**: Tree connection lines, level text `0/3`.
    - **Mode.ACTION**: CD Overlay, Keybind text, Drag & Drop (Swap) logic.
- **Visuals**:
    - Uses `Panel` background (behind parent) for distinct slot look.
    - Uses `TextureProgressBar` (Radial) for cooldowns.

## 3. Key Challenges & Solutions

### A. Reset Logic (The "Refund" Problem)
- **Issue**: `SkillData` only tracked *current* points, not *total earned*. Simply resetting points to 0 caused data loss.
- **Solution**: Implemented **Refund Calculation**.
    - Before clearing, the system iterates all acquired skills.
    - Loads the corresponding `Resource` to look up `skill_point_cost`.
    - Sums total spent points and refunds them to `skill_points` pool.

### B. Visual Dimming
- **Issue**: Icons in Action Bar appeared dark/dimmed.
- **Cause**: The `Panel` background was drawing *over* the button texture, and the button retained "Disabled" state logic from the Skill Tree.
- **Solution**:
    - Forced `panel.show_behind_parent = true` in Action Mode.
    - Explicitly set `disabled = false` and `button_pressed = false` when switching to Action Mode.

### C. Cooldown Smoothness
- **Issue**: Cooldown overlay animation was jerky (ticking in large chunks).
- **Cause**: `TextureProgressBar.step` defaulted to `1.0` (integer steps).
- **Solution**: Set `step = 0.01` to allow smooth float interpolation every frame.

## 4. Future Recommendations
- **Save System**: Ensure `skill_cooldowns` are not persistent across game restarts unless desired. (Currently in-memory).
- **Effect Implementation**: Connect `trigger_skill` to actual combat logic (Strategy Pattern recommended).
