extends BTAction

func _tick(delta: float) -> Status:
	var nav_comp : NavigationComponent= agent.navigation_component
	nav_comp.set_target_position_safely(agent.home.get_random_home_pos())
	return SUCCESS
