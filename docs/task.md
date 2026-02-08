# Tasks

# Tasks

- [x] **Phase 29: Advanced Dialogue & Social Interaction** <!-- id: 29 -->
    - [x] **Core Logic**
        - [x] Implement conditional dialogue (Inventory/Affection checks).
        - [x] Add `Memory` system to NPCManager.
    - [x] **Data**
        - [x] Create specialized Dialogue Resources.
    - [x] **Content**
        - [x] Add "First Meeting" unique dialogue.
        - [x] Verify data persistence with dialogue state.

- [x] **Phase 30: Data-Driven Quest System** <!-- id: 30 -->
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

- [x] **Phase 31: Quest UI & UX Polish** <!-- id: 31 -->
    - [x] **Design**
        - [x] Review references provided by user.
        - [x] Plan layout changes.
    - [x] **Implementation**
        - [x] Update `QuestLogUI.tscn` styling.
        - [x] Improve UX (animations, sound, distinct active/completed tabs).
        - [x] Fix critical crash (Flattened Scene) and Initialization race condition.
        - [x] Text Wrapping improvements (Word Smart).
    - [x] **Documentation**
        - [x] Create "Narrative & Quest Guide".

- [x] **Phase 32: System Documentation & Handover** <!-- id: 32 -->
    - [x] Create unified guide for Narrative design.
    - [x] Compile "How-to" for adding new Quests/NPCs.
    - [x] Update README with current progress.
