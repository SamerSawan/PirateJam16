extends BTAction

## Set move direction to the direction of the next navigation point

@export var bb_move_direction : StringName = &"move_direction"

func _tick(delta: float) -> Status:
	if agent is Creature:
		var next_pos : Vector2 = agent.navigation_agent.get_next_path_position()
		if not next_pos:
			return FAILURE
		var direction_of_next_nav_point = agent.global_position.direction_to(next_pos).normalized()
		blackboard.set_var(bb_move_direction, direction_of_next_nav_point)
		#print("Direction of next nav point: " + str(direction_of_next_nav_point))
		#print("\n")
		#print("Navigating to target")
		#print("\n")
		return SUCCESS
	return FAILURE
