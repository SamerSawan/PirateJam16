extends BTCondition

# if agent has a controller

func _tick(delta: float) -> Status:
	if agent is Creature:
		if agent.controller:
			return SUCCESS
	return FAILURE
