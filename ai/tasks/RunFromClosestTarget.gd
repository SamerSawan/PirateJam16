extends BTAction

@export var flee_distance_max : float = 192
@export var flee_distance_min : float = 64

@export var target_direction_modifier_min : int = -30 # adds variance to the direction of the target is, in degrees
@export var target_direction_modifier_max : int = 30

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature:
		var closest_target = blackboard.get_var("closest_target")
		if not closest_target:
			return FAILURE
		
		var direction_of_target : Vector2 = _agent.global_position.direction_to(closest_target.global_position) # comes normalized
		direction_of_target = direction_of_target.rotated(deg_to_rad(randi_range(target_direction_modifier_min, target_direction_modifier_max)))
		var direction_and_distance_to_travel = -direction_of_target * randf_range(flee_distance_min, flee_distance_max) # set target pos to - direction of target and flee distance units
		print("Fleeing by a factor of: " + str(direction_and_distance_to_travel))
		
		var nav_comp : NavigationComponent = _agent.navigation_component
		nav_comp.set_target_position_safely(_agent.global_position + direction_and_distance_to_travel)
		
		print("Running from closest target")
		return SUCCESS
	return FAILURE
