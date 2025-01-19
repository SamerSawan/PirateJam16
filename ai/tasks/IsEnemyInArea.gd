extends BTCondition

## Is enemy in my area

func _tick(delta: float) -> Status:
	if "vision_component" in agent:
		var vision : VisionComponent = agent.vision_component
		var has_target = vision.visible_targets.size() > 0
		if has_target:
			return SUCCESS
	return FAILURE
