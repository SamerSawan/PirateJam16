extends BTAction

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature:
		var closest_target = blackboard.get_var("closest_target")
		
		if not closest_target:
			return FAILURE
		
		var nav_comp : NavigationComponent = _agent.navigation_component
		nav_comp.set_target_position_safely(closest_target.global_position)
		
		print("\n")
		print("Running towards closest target")
		print("\n")
		return SUCCESS
	return FAILURE
