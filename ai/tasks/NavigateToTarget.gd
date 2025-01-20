extends BTAction

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature:
		var next_pos : Vector2 = _agent.navigation_agent.get_next_path_position()
		if not next_pos:
			return FAILURE
		var direction_of_next_nav_point = _agent.global_position.direction_to(next_pos).normalized()
		print("Direction of next nav point: " + str(direction_of_next_nav_point))
		_agent.movement_component.move( delta, direction_of_next_nav_point, _agent.stats_component.max_speed )
		
		print("Navigating to target")
		return SUCCESS
	return FAILURE
