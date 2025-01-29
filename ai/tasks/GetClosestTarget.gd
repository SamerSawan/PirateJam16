extends BTAction

@export var bb_closest_target : StringName = &"closest_target"

func _tick(delta: float) -> Status:
	if "vision_component" in agent:
		var vision_component : VisionComponent = agent.vision_component
		
		var closest_target = vision_component.get_closest_visible_node()
		if closest_target:
			print("Closest target acquired")
			blackboard.set_var(bb_closest_target, closest_target)
			return SUCCESS
		#push_warning("Closest target not found")
		blackboard.set_var(bb_closest_target, null)
	
	return FAILURE
