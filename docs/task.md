# Tasks

- [x] **Phase 24: NPC & Dialogue System** <!-- id: 24 -->
    - [x] **System Architecture**
        - [x] Install `Dialogue Manager` plugin (Done).
        - [x] Create `CustomBalloon` UI (Scene & Script).
        - [x] Create `NPCResource` datas (Static/Dynamic).
    - [x] **Content: Talula (Prototype)**
        - [x] Create `talula.dialogue` script.
        - [x] Create `Talula` NPC scene.
        - [x] Integrate interaction logic in `Town.gd`.
    - [x] **Verification**
        - [x] Speak to Talula -> UI opens.
        - [x] Portrait updates based on tags.
        - [x] Choices work and affect variables.

- [ ] **Phase 25: Save/Load Integration (Social)** <!-- id: 25 -->
    - [x] **Data Architecture**
        - [x] Update `GameData` to include `npc_save_data`.
        - [x] Verify `NPCManager.get_save_data()` logic.
    - [x] **System Integration**
        - [x] Connect `SaveManager.save_game()` to `NPCManager`.
        - [x] Connect `SaveManager.load_game()` to `NPCManager`.
        - [x] Implement `Reset` logic for New Game.
    - [ ] **Verification (Persistence)**
        - [ ] Run QA Test Plan (Phase 25).
        - [ ] Verify Affection persists across restart.
