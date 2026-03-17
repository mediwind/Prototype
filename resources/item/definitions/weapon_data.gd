extends EquipmentData
class_name WeaponData

enum AttackType {
	MELEE_ARC, # Scythe, Sword (Swing)
	MELEE_STAB, # Spear (Thrust)
	RANGED_PROJECTILE # Gun, Wand
}

@export_group("Combat Stats")
@export var attack_type: AttackType = AttackType.MELEE_ARC
@export var damage: float = 5.0
@export var cooldown: float = 0.5
@export var knockback_force: float = 200.0
@export var stun_duration: float = 0.2

@export_group("Visuals")
@export var is_procedural_visual: bool = true # If true, draws Polygon2D
@export var visual_color: Color = Color.WHITE
@export var attack_range: float = 1.0 # Tiles or Units? Let's assume Tiles for now (x16)
@export var arc_angle: float = 90.0 # Degrees
@export var visual_scene: PackedScene # For Sprite-based animations

@export_group("Ranged")
@export var projectile_scene: PackedScene
@export var projectile_speed: float = 500.0
