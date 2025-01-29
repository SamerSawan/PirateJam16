extends BTCondition

@export var target : StringName = &"target"

@export var distance_min: float = 0
@export var distance_max: float = 50

func _generate_name() -> String:
	return "InRange (%d, %d) of %s" % [distance_min, distance_max,
		LimboUtility.decorate_var(target)]

func _tick(delta: float) -> Status:
	var target : Node2D = blackboard.get_var(target)
	if is_instance_valid(target):
		var distance : float = agent.global_position.distance_to(target.global_position)
		if distance <= distance_max and distance >= distance_min:
			return SUCCESS
	return FAILURE
