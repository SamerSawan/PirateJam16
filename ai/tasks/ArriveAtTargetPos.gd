extends BTAction

@export var bb_target_pos : StringName = &"move_direction"

func _tick(delta: float) -> Status:
	var nav_agent : NavigationAgent2D = agent.navigation_agent
	if nav_agent.is_navigation_finished():
		return SUCCESS
	if agent.has_signal("input_move"):
		var movement_direction = blackboard.get_var(bb_target_pos)
		if movement_direction and agent.stats_component:
			#print("Emitting movement signal")
			agent.input_move.emit(delta, movement_direction, agent.stats_component.cur_speed)
		return RUNNING
	return FAILURE
