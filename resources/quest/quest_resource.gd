extends Resource
class_name QuestResource

@export_group("Identity")
@export var id: String
@export var title: String
@export_multiline var description: String

@export_group("Objectives")
@export var objectives: Array[QuestObjectiveResource]

@export_group("Rewards")
@export var rewards: Array[QuestRewardResource]

# Metadata/State hints
@export var repeat_type: String = "once" # once, daily, repeatable
