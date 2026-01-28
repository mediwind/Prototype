# Task List (Refactor & Fix)

- [x] **Fix: Crash on Main Menu**
    - [x] Implement `has_save_file() -> bool` in `SaveManager`.
    - [x] Alias `save_game()` -> `save_game_data()` (or rename).
    - [x] Alias `load_game()` -> `load_game_data()` (or rename).
- [ ] **Refactor: Scene Renaming**
    - [ ] Rename `scenes/main/main.tscn` -> `scenes/combat/combat.tscn`.
    - [ ] Rename `scenes/main/main.gd` -> `scenes/combat/combat.gd`.
    - [ ] Update `project.godot` run/main_scene? (Already set to TitleScreen, so just references).
    - [x] Update `ArenaTimeManager` or other references to `combat.tscn`.
- [x] **Manual Action Required**
    - [x] Delete `scenes/main/main.tscn` from Godot Editor (Fixes "Missing Dependency" error).
    - [x] Rename `scenes/main/` folder to `scenes/combat/` (User initiated).
    - [x] Open `scenes/combat/combat.tscn` to verify.
