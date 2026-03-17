# Neighborvania Prototype

A "Social Metroidvania" RPG blending farming, community building, and exploration.

## 🌟 Current Status (Phase 32 Complete)

The project has established a solid foundation for all core gameplay loops.

### 1. Social Systems (New!)
*   **Dialogue:** Branching conversations with "Dialogue Manager". Supports conditional logic (Inventory/Affection).
*   **Quests:** Data-driven Quest System (`QuestResource`). Includes Fetch/Talk objectives and UI tracking.
*   **NPCs:** Daily schedules (Home <-> Plaza) and persistent affection/memory system.

### 2. Farming & Nature
*   **Growth:** "Growth Point" based system with fertilizer support (Nutrients).
*   **Tools:** Hoe (Till), Watering Can (Water), Scythe (Harvest).
*   **Persistence:** Crops save/load correctly across scenes.

### 3. Building & Housing
*   **Placement:** Grid-based furniture placement system.
*   **Interiors:** `PlayerHome` scene with time dilation (Time pauses indoors).
*   **Storage:** Functional Chests with inventory UI.

### 4. Combat & Exploration
*   **Action System:** Unified `EquipmentActionHandler` for Weapons and Tools.
*   **Enemies:** Basic AI with knockback and floating damage numbers.
*   **World:** Portal system for seamless scene transitions.

---

## 📚 Documentation
Check the `docs/` folder for detailed guides:
*   `manual_narrative_quest_guide.md`: How to write Dialogue & Quests.
*   `manual_npc_scheduling_kr.md`: How to set up NPC schedules.
*   `building_system_manual.md`: How to add new furniture.
*   `task.md`: Current development roadmap.

## 🚀 Next Steps
*   Expand content (More NPCs, Quests, Items).
*   Refine Combat mechanics (Skills, Bosses).
*   Polish Visuals (Art, Animations).
