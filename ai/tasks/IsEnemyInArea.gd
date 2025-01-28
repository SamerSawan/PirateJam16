extends BTCondition

@export var min_range: float = 0.0
@export var max_range: float = 10.0

func _tick(delta) -> Status:
	if blackboard.has_var("player"):
		var player = blackboard.get_var("player")
		if player:
			var distance = agent.global_position.distance_to(player.global_position)
			
			if distance >= min_range and distance <= max_range:
				return SUCCESS
	return FAILURE
