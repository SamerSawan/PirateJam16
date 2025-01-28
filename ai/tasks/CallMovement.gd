extends BTAction

## Calls movement code

func _tick(delta: float) -> Status:
	if agent.has_signal("input_move"):
		var movement_direction = blackboard.get_var("move_direction")
		if movement_direction and agent.stats_component:
			#print("Emitting movement signal")
			agent.input_move.emit(delta, movement_direction, agent.stats_component.cur_speed)
	return SUCCESS
