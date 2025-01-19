extends BTAction

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if not "navigation_agent_2d" in _agent:
		return FAILURE
	var nav_agent : NavigationAgent2D = _agent.navigation_agent_2d
	
	var closest_target = blackboard.get_var("closest_target")
	
	if not nav_agent or not closest_target:
		return FAILURE
		
	var direction_of_target : Vector2 = _agent.global_position.direction_to(closest_target)
	
	## init raycast
	#var raycast = RayCast2D.new()
	#_agent.add_child(raycast)
	#raycast.collide_with_bodies = true
	#raycast.set_collision_mask_value(Utils.COLLISIONLAYERS.GROUND, true)
	#
	
	# set target pos to - direction of target and flee distance units
	if not "flee_distance" in _agent:
		return FAILURE
	var direction_and_distance_to_travel = -sign(direction_of_target).normalized() * nav_agent.flee_distance
	nav_agent.target_position = _agent.global_position + direction_and_distance_to_travel
	return SUCCESS
