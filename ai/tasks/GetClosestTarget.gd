extends BTAction

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature and "vision_component" in _agent:
		var vision : VisionComponent = _agent.vision_component
		var targets = vision.detection_raycaster.detection_targets
		
		blackboard.set_var("closest_target", null)
		var closest_target = null
		
		# if not targets fail
		if not targets.size() > 0 or not targets[0]:
			return FAILURE
			
		# if not closest target, set it
		if not closest_target:
			blackboard.set_var("closest_target", targets[0])
			closest_target = blackboard.get_var("closest_target")
		
		for target in targets:
			var target_distance = target.global_position.distance_to(_agent.global_position)
			var closest_target_distance = closest_target.global_position.distance_to(_agent.global_position)
			if target_distance < closest_target_distance:
				blackboard.set_var("closest_target", target)
		
		if closest_target:
			#print("\n")
			#print("Closest target acquired")
			#print("\n")
			return SUCCESS
	
	return FAILURE
