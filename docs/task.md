# Task List

- [x] **Phase 20: System Infrastructure & Scene Flow** <!-- id: 20 -->
    - [x] **Scene Management**
        - [x] Create `SceneManager` (Autoload) with `change_scene(file_path)` and fade transition.
        - [x] Refactor `ArenaTimeManager` to use `SceneManager`.
    - [x] **System UI (Pause & Persistence)**
        - [x] Create `SystemMenu` (Pause/Settings/Save/Load).
        - [x] Create `TitleScreen` (New Game/Continue/Exit).
        - [x] Integrate `SaveManager` with UI buttons.
    - [x] **Verification**
        - [x] Verify scene transitions (Town <-> Battle) with Fade effect.
        - [x] Verify Save/Load cycle purely through UI (Ensure New Game resets data).
        - [x] Fix In-Game Load to correctly reload scene (Force reload to Town).
        - [x] Implement Battle Save Restriction (Disable Save in Combat).

