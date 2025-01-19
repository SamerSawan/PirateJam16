extends BTAction

func _tick(delta: float) -> Status:
	if "vision_component" in agent:
		var vision : VisionComponent = agent.vision_component
		var targets = vision.detection_raycaster.detection_targets
		
		blackboard.set_var("closest_target", null)
		var closest_target = null
		
		# if not targets fail
		if not targets[0]:
			return FAILURE
			
		# if not closest target, set it
		if not closest_target:
			blackboard.set_var("closest_target", targets[0])
			closest_target = blackboard.get_var("closest_target")
		
		for target in targets:
			var target_distance = target.global_position.distance_to(agent.global_position)
			var closest_target_distance = closest_target.global_position.distance_to(agent.global_position)
			if target_distance < closest_target_distance:
				blackboard.set_var("closest_target", target)
		
		if closest_target:
			return SUCCESS
	
	return FAILURE
