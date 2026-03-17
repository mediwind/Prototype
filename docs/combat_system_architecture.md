# ⚔️ Combat System Architecture & Flow

This document explains the core architecture of the combat system, focusing on the Data-Driven design and the strict separation between Logic and Visuals.

## 1. High-Level Architecture

The system is designed around **Composition**. The Player (or Enemy) does not know how to "attack". Instead, they delegate the intent to a specialized handler.

### Key Components

| Component | Role | Analogy |
| :--- | :--- | :--- |
| **WeaponData** | Stores combat stats (Damage, Range, Cooldown). | "The Sword Blueprint" |
| **ToolData** | Stores farming stats (Radius, Water Cost) & weak combat stats. | "The Tool Blueprint" |
| **EquipmentActionHandler** | Central brain. Routes logic for Weapons (Combat) AND Tools (Farming). | "The Brain & Muscle" |
| **ActionVisualEffect** | Renders visual feedback (Slash arcs, Particles). | "The Special FX" |
| **HurtboxComponent** | Receives damage and notifies Health. | "The Armor" |
| **FloatingTextSpawner** | Listens for health changes and shows numbers. | "The Scoreboard" |

---

## 2. Determines Logic vs. Visuals (Crucial Concept)

We strictly separate **what happens** (Logic) from **what you see** (Visuals).

*   **Logic (EquipmentActionHandler)**
    *   Runs on the Server/CPU.
    *   Uses Physics Engine (`intersect_shape`) to find targets.
    *   Apply Damage & Knockback.
    *   *Invisible to the eye.*

*   **Visuals (ActionVisualEffect)**
    *   Runs on the GPU/Screen.
    *   Draws shapes or plays animations.
    *   **Has NO collision or damage logic.**
    *   *Pure eye candy.*

> **Why?** This prevents bugs where "I saw the sword hit but no damage!" or "I took damage but didn't see it!". The Logic is the single source of truth; the Visual just visualizes that truth.

---

## 3. The Life of a Swing (Step-by-Step Flow)

What exactly happens when you click the mouse?

### 🏁 Step 1: Input & Delegation
1.  **Player Clicks:** `Town.gd` (or Player Input) detects a click.
2.  **Check Hand:** It sees you are holding a Scythe (`ItemData`).
3.  **Delegation:** It calls `player.perform_action(item)`.
    *   *Note:* The Player script essentially says: "I don't know how to use this. Hey **EquipmentActionHandler**, you handle it!"

### 🧠 Step 2: The Handler Takes Over
The `EquipmentActionHandler` activates and performs two parallel tasks:

**Task A: The Visuals**
*   It creates a **NEW** `ActionVisualEffect` instance.
*   "Draw a white arc here!"
*   The effect plays for 0.2s and then deletes itself (`queue_free`).

**Task B: The Logic (Physics & Game Rules)**
*   It checks the Item Type (`WeaponData` vs `ToolData`).
*   **If Weapon:**
    *   Creates a **Physics Query** (Sector/Arc).
    *   Finds Enemies -> Applies Damage + Knockback.
*   **If Tool (Hoe/Watering Can):**
    *   Converts position to **Grid Coordinates**.
    *   Calls `FarmManager` (Till/Water).
    *   *Special Case (Scythe/Hoe):* Can also trigger a weak "Physics Query" to hit enemies (Damage 1).

### 💥 Step 3: Impact & Reaction
If the Physics Query finds a `WizardEnemy`:

1.  **Knockback:** Handler pushes the enemy's `KnockbackComponent`.
2.  **Damage:** Handler calls `Hurtbox.handle_hit(damage)`.
3.  **Signal:** Enemy's `HealthComponent` reduces HP and shouts a signal: *"Health Changed!"*

### 🎨 Step 4: Feedback (UI)
1.  **Listen:** The `FloatingTextSpawner` attached to the Enemy hears the signal.
2.  **Spawn:** It calculates the difference and spawns a floating number.
    *   **Damage:** White Color.
    *   **Heal:** Green Color.

---

## 4. FAQ: Node Structure

### Why is `EquipmentActionHandler` a Child Node but not a Scene?
In Godot, you don't *have* to make everything a `.tscn` file.
*   **Simple Node:** You can create a plain `Node` or `Node2D` in the scene tree and attach a script (`.gd`).
*   **Scene (.tscn):** Necessary only if the object has a complex hierarchy (e.g., a Character with Sprite + Collision + AnimationPlayer).
*   **Result:** `EquipmentActionHandler` is just Logic attached to a Node position. It doesn't need child nodes like Sprites, so a simple Script-on-Node suffices.

### Why `$Access` works?
As long as the Node exists in the Scene Tree as a child, the parent can access it via `$Name`. It doesn't matter if it came from a `.tscn` file or was created manually in the editor.
