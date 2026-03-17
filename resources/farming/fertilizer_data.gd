extends Resource
class_name FertilizerData

enum FertilizerType {
	QUALITY,
	SPEED,
	WATER_RETENTION
}

@export var type: FertilizerType = FertilizerType.QUALITY
@export var tier: int = 1 # 1: Basic, 2: Quality, 3: Deluxe
@export var effect_value: float = 0.1 # e.g. 0.1 = 10% boost
@export var duration_days: int = -1 # -1: Permanent (until season end/harvest?), >0: Limited days
