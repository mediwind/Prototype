# Phase 20: System Infrastructure & Scene Flow

## Goal Description
Establish the foundational "Legs" of the game: robust scene management and accessible system menus.
This phase aims to eliminate development friction by allowing instant Save/Load testing and providing smooth, professional transitions between game states (Title -> Town -> Battle).

## User Review Required
> [!NOTE]
> **UI Theming Strategy**: We will adopt a **"Function First, Theme Later"** approach.
> All UI will be built using standard Godot Controls (`Button`, `Panel`, `Label`) without applying complex styles initially.
> This prevents "Technical Debt" because Godot's Theme system mimics CSS: we can apply a global `main_theme.tres` later, and all standard controls will update automatically.
> **Constraint**: Do not override styles in the Inspector (e.g., "Theme Overrides -> Styles") unless absolutely necessary for layout logic. Use the default look for now.

## Proposed Changes

### System Core
#### [NEW] [scene_manager.gd](file:///d:/Godot/Prototype/scenes/manager/scene_manager.gd)
- **Autoload**: Register as `SceneManager`.
- **Function**: `change_scene(scene_path: String, transition_type: String = "fade")`
- **Implementation**:
  - Instantiates a high-Z-index `ColorRect` (created via code or separate scene).
  - Tweens opacity (0 -> 1).
  - Calls `get_tree().change_scene_to_file()`.
  - Tweens opacity (1 -> 0).

### UI System
#### [NEW] [system_menu.tscn](file:///d:/Godot/Prototype/scenes/ui/system_menu/system_menu.tscn)
- **Type**: `CanvasLayer` (Z-Index High).
- **Structure**:
  - `PanelContainer` (Center)
    - `VBoxContainer`
      - `Button`: Resume
      - `Button`: Save
      - `Button`: Load
      - `Button`: Options (Placeholder)
      - `Button`: Main Menu
      - `Button`: Quit
- **Logic**:
  - Pauses the tree when opened (`Process Mode: Always`).
  - Connects buttons to `SaveManager` and `SceneManager`.

#### [NEW] [title_screen.tscn](file:///d:/Godot/Prototype/scenes/ui/title_screen/title_screen.tscn)
- **Structure**:
  - Background Image
  - `VBoxContainer`
    - `Button`: New Game
    - `Button`: Continue (Disabled if no save)
    - `Button`: Quit

### Refactoring
#### [MODIFY] [arena_time_manager.gd](file:///d:/Godot/Prototype/scenes/manager/arena_time_manager.gd)
- Replace direct `get_tree().change_scene_to_packed` with `SceneManager.change_scene()`.

## Verification Plan

### Automated Tests
- None (UI interaction).

### Manual Verification
1.  **Title Screen**: Launch game. Click "New Game". Verify fade to Town.
2.  **Pause Menu**: In Town, press ESC. Menu appears. Game pauses.
3.  **Save/Load**:
    - Move player.
    - Press ESC -> Save.
    - Move player somewhere else.
    - Press ESC -> Load.
    - Verify player returns to saved position.
4.  **Scene Transition**: 
    - Wait for Battle. 
    - Win Battle.
    - Verify smooth fade back to Town.
