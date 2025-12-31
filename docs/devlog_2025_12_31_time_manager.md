# DevLog: TimeManager Implementation
**Date**: 2025-12-31
**Topic**: TimeManager Implementation (Calendar, Daily Ticks, Persistence)

## 1. Overview
The goal was to implement a robust `TimeManager` system to handle the game's temporal flow. This system manages the 112-day year cycle (4 seasons x 28 days) and provides the heartbeat for all time-based game mechanics (NPC schedules, farming, etc.).

## 2. Architecture Changes
### TimeManager (Autoload)
- **Role**: Central clock and calendar authority. registered as an Autoload in `project.godot`.
- **Key Features**:
    - **Custom Calendar**: 112-day year structure (Spring, Summer, Fall, Winter).
    - **Time Scale**: Adjustable `time_scale` (Default `60.0`: 1 real second = 1 game minute).
    - **Persistence**: Built-in `get_save_data()` and `load_save_data()` for easy saving/loading.

### Signals
The system broadcasts granular signals for other systems to hook into:
- `minute_passed` / `hour_passed`: For UI clocks and NPC schedules.
- `day_started`: Fires at **00:00**. Updates the displayed date.
- `day_passed`: Fires at **06:00**. The "Logic Tick" for daily updates.
- `season_changed` / `year_changed`: For environment and long-term progression.

## 3. Key Challenges & Solutions
### The "Dawn" vs "Midnight" Problem
- **Issue**: In many farming sims, the day technically changes at midnight, but new crops or resources shouldn't appear while the player is still awake at 2 AM.
- **Solution**: Decoupled the **Visual Date** from the **Logical Day**.
    - **00:00 (Midnight)**: Trigger `day_started`. The UI date updates (e.g., "Spring 1" -> "Spring 2").
    - **06:00 (Morning)**: Trigger `day_passed`. This is the "Logic Tick". Crops grow, resources respawn, and shop inventories refresh.
    - This allows night owls to finish their activities without sudden world changes in the dark.

## 4. Future Recommendations
- **Save System Integration**: Ensure `TimeManager.get_save_data()` is called by the `SaveManager`.
- **Pause Handling**: Connect `TimeManager.is_paused` to the UI Manager or Cutscene Manager to stop time during menus/dialogues.
- **Sun/Moon Cycle**: Use `accumulated_time` (or hour) to drive a `WorldEnvironment` directional light rotation.
