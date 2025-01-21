extends BTCondition

## HasVisionOfEnemy

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature and "vision_component" in _agent:
		var vision : VisionComponent = agent.vision_component
		var has_target = vision.visible_targets.size() > 0
		if has_target:
			#print("\n")
			#print("Has vision of enemy")
			#print("\n")
			return SUCCESS
	return FAILURE
