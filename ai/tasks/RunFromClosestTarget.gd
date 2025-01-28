extends BTAction

@export var bb_closest_target_node = &"target_node"

@export var flee_distance_max : float = 256
@export var flee_distance_min : float = 128

@export var target_direction_modifier_min : float = -30 # adds variance to the direction of the target is, in degrees
@export var target_direction_modifier_max : float = 30

func _tick(delta: float) -> Status:
	if agent is Creature:
		var closest_target = blackboard.get_var(bb_closest_target_node)
		if closest_target:
			var direction_of_target : Vector2 = agent.global_position.direction_to(closest_target.global_position) # comes normalized
			var direction_with_random_variance = direction_of_target.rotated(deg_to_rad(randf_range(target_direction_modifier_min, target_direction_modifier_max)))
			var direction_and_distance_to_travel = -direction_with_random_variance * randf_range(flee_distance_min, flee_distance_max) # set target pos to - direction of target and flee distance units
			
			var nav_comp : NavigationComponent = agent.navigation_component
			var nav_agent : NavigationAgent2D = agent.navigation_agent
			if nav_comp:
				var new_pos = agent.global_position + direction_and_distance_to_travel
				if not nav_agent.get_final_position():
					# Randomly rotate by either +90 or -90 degrees
					var random_sign = 1 if randi_range(1, 2) % 2 == 0 else -1
					var adjusted_direction = direction_and_distance_to_travel.rotated(deg_to_rad(90 * random_sign))
					new_pos = agent.global_position + adjusted_direction
				
				nav_comp.set_target_position_safely(new_pos)
				print("Fleeing to: ", new_pos)
				return SUCCESS
	return FAILURE
