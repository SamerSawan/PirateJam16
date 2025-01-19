extends BTCondition

## Is enemy in my area

func _tick(delta: float) -> Status:
	if "vision_component" in agent:
		var target = agent.vision_component
		if target:
			return SUCCESS
	return FAILURE
