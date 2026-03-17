extends QuestRewardResource
class_name RewardItem

@export var item: ItemData
@export var amount: int = 1

func give_reward(_context: Node) -> void:
	if item:
		InventoryManager.add_item(item, amount)
		print("Quest Reward: Added %d %s" % [amount, item.name])
