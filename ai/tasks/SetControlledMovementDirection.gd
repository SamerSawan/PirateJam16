extends BTAction

## Set move direction to the input direction of player

func _tick(delta: float) -> Status:
	if agent.controller is Player:
		blackboard.set_var("move_direction", agent.controller.direction)
		return SUCCESS
	return FAILURE
