extends BTAction

var _agent : CharacterBody2D
func _enter():
	_agent = agent

func _tick(delta: float) -> Status:
	if _agent and _agent is Creature and "vision_component" in _agent:
		var vision_component : VisionComponent = _agent.vision_component
		var closest_target = vision_component.get_closest_visible_target()
		if closest_target:
			print("Closest target acquired")
			blackboard.set_var("closest_target", closest_target)
			return SUCCESS
	blackboard.set_var("closest_target", null)
	return FAILURE
