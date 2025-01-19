extends BTAction

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature and "navigation_agent" in _agent and "flee_distance" in _agent:
		var nav_agent : NavigationAgent2D = _agent.navigation_agent
		
		var closest_target = blackboard.get_var("closest_target")
		
		if not closest_target:
			return FAILURE
		
		var direction_of_target : Vector2 = _agent.global_position.direction_to(closest_target.global_position)
		
		## init raycast
		#var raycast = RayCast2D.new()
		#_agent.add_child(raycast)
		#raycast.collide_with_bodies = true
		#raycast.set_collision_mask_value(Utils.COLLISIONLAYERS.GROUND, true)
		#
		
		# set target pos to - direction of target and flee distance units
		if not "flee_distance" in _agent:
			return FAILURE
		var direction_and_distance_to_travel = (-sign(direction_of_target).normalized()) * _agent.flee_distance
		print("Fleeing by a factor of: " + str(direction_and_distance_to_travel))
		
		var nav_comp : NavigationComponent = _agent.navigation_component
		nav_comp.set_target_position_safely(_agent.global_position + direction_and_distance_to_travel)
		
		print("Running from closest target")
		return SUCCESS
	return FAILURE
