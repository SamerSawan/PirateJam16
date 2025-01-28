extends BTAction

## Uses RUNNING to arrive at target position

func _tick(delta: float) -> Status:
	if agent is Creature:
		if not agent.navigation_agent.is_navigation_finished():
			var next_pos : Vector2 = agent.navigation_agent.get_next_path_position()
			if not next_pos:
				return FAILURE
			var direction_of_next_nav_point = agent.global_position.direction_to(next_pos).normalized()
			if direction_of_next_nav_point and agent.stats_component:
				agent.input_move.emit(delta, direction_of_next_nav_point, agent.stats_component.cur_speed)
			#print("Direction of next nav point: " + str(direction_of_next_nav_point))
			#print("\n")
			#print("Navigating to target")
			#print("\n")
			return SUCCESS
	return FAILURE
