# Devlog: Combat System Architecture & Refactoring
**Date:** 2026-01-21
**Topic:** Phase 11 & 12 - Data-Driven Action System

## 1. Overview
This update completes a major refactoring of the combat and tool interaction system. We moved away from hardcoded logic in `Town.gd` to a flexible, **Data-Driven Architecture** using `Resource` files. This allows us to create new weapons and tools simply by creating new data files in the Inspector, without writing code.

## 2. Key Components

### 🧠 EquipmentActionHandler (formerly ActionController)
*   **Role:** The "Brain" of item usage.
*   **Function:** It takes an `ItemData` (specifically its `WeaponData`), calculates where the player is aiming, checks for collisions (Hitbox/Hurtbox), and orchestrates the entire action.
*   **Why:** Previously, `Town.gd` handled input, direction, damage, and effects all in one place. Now, `EquipmentActionHandler` encapusulates this logic, making it reusable for both Players and eventually Enemies.

### 📄 WeaponData (Resource)
*   **Role:** The "Stats" of an item.
*   **Properties:** `damage`, `cooldown`, `range`, `arc_angle`, `knockback_force`, `attack_type`.
*   **Benefit:** To balance the game, we simply tweak these numbers in the Inspector. No script editing required.

### ✨ ActionVisualEffect
*   **Role:** The "Eye Candy".
*   **Function:** Handles the visual representation of an attack (e.g., the white "swing" arc, particle effects).
*   **Collaboration:** `EquipmentActionHandler` calculates *what* happens, and then tells `ActionVisualEffect` to *show* it. This strict separation (Logic vs View) ensures cleanly readable code.

### 💥 Knockback & Floating Text
*   **KnockbackComponent:** Added to enemies. Calculates physics impulses when hit. Now standard across `BasicEnemy` and `WizardEnemy`.
*   **FloatingTextSpawner:** Universal system listening to `HealthComponent`. Automatically spawns damage numbers (White) or healing numbers (Green) without the attacker needing to know about UI.

## 3. How to Add a New Weapon
1.  **Create Resource:** Right-click in FileSystem -> Create New -> `Resource` -> Search `WeaponData`.
2.  **Configure:** Set `Damage`, `Range`, `Arc Angle` (e.g., 360 for spin, 90 for stab).
3.  **Assign:** Open a Tool/Weapon Item (e.g., `Sword.tres`) and drag your new `WeaponData` into the `Equipment Data` slot.
4.  **Done:** The `EquipmentActionHandler` will automatically adapt to the new stats.

## 4. Refactoring Notes (ActionController -> EquipmentActionHandler)
During development, we realized `ActionController` was too generic. We renamed it to `EquipmentActionHandler` to strictly define its scope: **handling actions triggered by equipment**.
*   **Lesson:** Renaming scripts referenced by Scenes (`.tscn`) requires care. The `.tscn` file references scripts by UID/Path. Deleting and recreating a script breaks this link. The safest way is to rename **inside the Godot Editor**, which automatically updates all references.

## 5. How It Works: The Life of a Swing (Step-by-Step)
Here is the journey of a single attack, from clicking the mouse to seeing a damage number.

### 🏁 Step 1: Input (The Trigger)
1.  **Player Clicks:** You click the Left Mouse Button.
2.  **`Town.gd`:** Detects the input and sees you are holding a tool (e.g., Scythe).
3.  **Delegation:** It calls `player.perform_action(item, mouse_pos)`.

### 🧠 Step 2: The Brain (EquipmentActionHandler)
1.  **Analysis:** The `EquipmentActionHandler` looks at the `WeaponData` inside the item.
2.  **Calculation:** It calculates the direction to your mouse.
3.  **Visuals:** It immediately tells `ActionVisualEffect` to "Play" (draw the white arc).
4.  **Physics:** It calculates a "Hit Zone" (Circle Shape) and asks the Physics Engine: *"Who is in this area?"*
5.  **Filtering:** It checks if the targets are within the **Arc Angle** (e.g., 60 degrees in front of you).

### 💥 Step 3: The Impact (Hurtbox & Health)
1.  **Hit:** The Handler finds a `WizardEnemy`.
2.  **Knockback:** It pushes the enemy's `KnockbackComponent` (adding velocity).
3.  **Damage:** It calls `handle_hit(damage)` on the enemy's `HurtboxComponent`.
4.  **Health Update:** The Hurtbox tells the `HealthComponent` to subtract Health.

### 🎨 Step 4: The Feedback (Floating Text)
1.  **Signal:** When Health changes, `HealthComponent` shouts a signal: *"I lost 11 HP!"*
2.  **Spawner:** The `FloatingTextSpawner` (attached to the Enemy) hears this signal.
3.  **Pop:** It spawns a floating label showing "11" in white, which floats up and fades away.

---

## 6. Next Steps
With the combat foundation solid, we are ready to expand the **Farming System (Phase 13)**, utilizing the same 'Action' logic for more complex farming tools if needed.
