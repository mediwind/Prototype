# Tasks

# Tasks

- [ ] **Phase 29: Advanced Dialogue & Social Interaction** <!-- id: 29 -->
    - [x] **Core Logic**
        - [x] Implement conditional dialogue (Inventory/Affection checks).
        - [x] Add `Memory` system to NPCManager.
    - [x] **Data**
        - [x] Create specialized Dialogue Resources.
    - [x] **Content**
        - [x] Add "First Meeting" unique dialogue.
        - [x] Verify data persistence with dialogue state.

- [ ] **Phase 30: Data-Driven Quest System** <!-- id: 30 -->
    - [x] **Architecture (Inspector-First)**
        - [x] Create `QuestResource` (ScriptableObject for quest data).
        - [x] Create `QuestManager` (Autoload for active quest state).
    - [x] **Data Structure**
        - [x] Define `QuestObjective` (Enum/Class for fetch, talk, etc).
        - [x] Create `QuestDefinition` (Title, Desc, Objectives, Rewards).
    - [x] **Integration**
        - [x] Connect `QuestManager` to `NPCManager` and `InventoryManager`.
        - [x] expose `QuestManager` helpers to Dialogue (`can_start_quest`, `complete_quest`).
    - [x] **UI**
        - [x] Create simple `QuestLogUI`.
