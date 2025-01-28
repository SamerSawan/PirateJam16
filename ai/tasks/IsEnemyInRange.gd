extends BTCondition

@export var min_range: float = 0.0
@export var max_range: float = 10.0

func _tick(delta) -> BT.Status:
	var player = blackboard.get_var("player")
	var distance = agent.global_transform.origin.distance_to(player.global_transform.origin)
	
	if distance >= min_range and distance <= max_range:
		return SUCCESS
	else:
		return FAILURE
