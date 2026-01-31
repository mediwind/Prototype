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
# Archive

- [x] **Phase 21: World Expansion & Interiors** <!-- id: 21 -->
    - [x] **Core Systems**
        - [x] Implement `TimeManager.set_calendar_time_multiplier` for variable time flow.
        - [x] Create `SpawnPoint` component (Marker2D with ID).
        - [x] Create `Portal` component (Area2D with target scene/spawn tag).
        - [x] Update `SceneManager` to handle `spawn_tag` positioning.
        - [x] Implement `GameData` persistence for Scene Path & Position (Bonus Integrity).
    - [x] **World Content Expansion (Portals & Interiors)**
        - [x] Create `PlayerHome` scene (Interior).
        - [x] Create `HouseExterior` prefab.
        - [x] Implement `Portal` system (Scene Transition).
        - [x] Verify Time Dilation (Indoor Pause).
    - [x] **QA & Bug Fixes**
        - [x] Fix Title Screen Continue Logic (Load correct scene).
        - [x] Fix Scene Transition Glitch (Move player during fade).
        - [x] Fix Multi-Scene Persistence (Ghost Objects).
        - [x] Fix Data Corruption on Save (Metadata overwrite).
        - [x] Fix Indoor Interaction (Parent check logic).
        - [x] Verify Portal travel places player at correct SpawnPoint.
        - [x] Verify Time passes normally in Town and stops/slows in Interior (if configured).

- [ ] **Phase 22: UI Architecture Refactoring** <!-- id: 22 -->
    - [ ] **Architecture Setup**
        - [ ] Create `GameUI` scene (CanvasLayer) to persist across scenes.
        - [ ] Implement `UIManager` (Autoload) to manage HUD and Menus.
        - [ ] Migrate `TownUI` components (Action Bar, Buttons) to `GameUI`.
    - [ ] **Logic Migration**
        - [ ] Move Input Handling (I, K, Esc) from `Town/Home.gd` to `UIManager`.
        - [ ] Connect `InventoryUI`, `SkillTreeUI` instantiation to `GameUI`.
    - [ ] **Cleanup**
        - [ ] Remove local UI nodes from `Town.tscn` and `PlayerHome.tscn`.
        - [ ] Remove UI code from `Town.gd` and `PlayerHome.gd`.
    - [ ] **Verification**
        - [ ] Verify HUD persists when moving Town <-> Home.
        - [ ] Verify Menus open/close correctly in both scenes.

