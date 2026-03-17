# Devlog: Farming Skills & Core Refactoring (2026-01-15)

## 📌 Summary
Today, we completed **Phase 8 (Core Refactoring)** and **Phase 9 (Farming Skills)**. The focus was on transforming rigid systems (integer-day growth, single leveling) into scalable, data-driven architectures capable of supporting complex RPG mechanics. We also established a standard workflow for AI collaboration.

## 🛠️ Key Changes

### 1. Farming System Refactor (Precision Growth)
- **Problem:** Growth was tracked by simple day counts (`days_grown: int`), making it hard to apply percentage-based buffs (e.g., +10% speed).
- **Solution:** Switched to **Accumulated Growth Points (`float`)**.
    - Base Logic: 1 Day = 100.0 Points.
    - Scalability: Now we can easily apply multipliers (e.g., `daily_points * 1.5`) without rounding errors.
    - Formula: `Growth = Base(100) * (1.0 + Fertilizer + PassiveSkill)`

### 2. Multi-Category Leveling System
- **Feature:** Refactored `LevelAndExpManager` to support distinct categories (Farming, Combat, Mining, etc.).
- **Main Level:** Now calculated dynamically based on the aggregate of all category levels (Skyrim-style), rather than being a separate stat.
- **Safety:** Added auto-initialization for missing categories in save data, ensuring backward compatibility.

### 3. Passive Skill System
- **Implementation:** Adopted a **"Polling" architecture**. Instead of skills pushing changes, systems (`FarmManager`, `Town`) poll `SkillManager.has_skill(id)` during relevant events.
- **New Skills:**
    - **Fast Grower:** +200% Growth Speed (Test Value). Implemented in `FarmManager`.
    - **Master Farmer:** +100% Quality Chance (Test Value). Implemented in `Town.gd`.
- **UI:** Added a dedicated **Farming Skill Tree** tab and automated icon assignment for `SkillButton` (QoL).

### 4. Agent Collaboration Workflow
- **Issue:** Context loss between sessions and lack of persistent documentation.
- **Solution:**
    - **Migration:** Moved `task.md` and `walkthrough.md` to the persistent `docs/` folder.
    - **Rules:** Updated `godot-rpg-game-dev-rules.md` with **Start-End Routines** and **Commit Standards**.
    - **Protocol:** Agents now read `docs/task.md` at start and update it at end.

## 📝 Next Steps (Phase 10)
- **Tools & Interaction:** Implement `Scythe` range mechanics using `ShapeCast2D` or `Area2D`.
- **Visuals:** Add simple feedback for tool range before implementing full animations.
