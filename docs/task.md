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

- [ ] **Phase 21: World Expansion & Interiors** <!-- id: 21 -->
    - [x] **Core Systems**
        - [x] Implement `TimeManager.set_calendar_time_multiplier` for variable time flow.
        - [x] Create `SpawnPoint` component (Marker2D with ID).
        - [x] Create `Portal` component (Area2D with target scene/spawn tag).
        - [x] Update `SceneManager` to handle `spawn_tag` positioning.
        - [x] Implement `GameData` persistence for Scene Path & Position (Bonus Integrity).
    - [ ] **Content**
        - [x] Create `PlayerHome.tscn` (Interior).
        - [ ] Connect Town ↔ Home via Portals.

    - [x] **Verification**
        - [x] Verify Portal travel places player at correct SpawnPoint.
        - [x] Verify Time passes normally in Town and stops/slows in Interior (if configured).



