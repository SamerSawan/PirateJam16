extends BTAction

@export var bb_closest_target_node : StringName = "target_node"
@export var bb_closest_target_pos : StringName = "target_node_pos"

func _tick(delta: float) -> Status:
	if "vision_component" in agent:
		var vision_component : VisionComponent = agent.vision_component
		var closest_target = vision_component.get_closest_visible_node()
		if closest_target:
			#print("Closest target acquired")
			blackboard.set_var(bb_closest_target_node, closest_target)
			return SUCCESS
	blackboard.set_var(bb_closest_target_node, null)
	return FAILURE
