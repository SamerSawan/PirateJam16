extends BTCondition

# is target within up and down constraints?

@export var up_min : float = -20
@export var down_max : float = 20

@export var bb_target_pos : StringName = &"target_pos"

func _tick(delta: float) -> Status:
	var target_pos = blackboard.get_var(bb_target_pos)
	if target_pos is Vector2:
		var target_pos_to_local : Vector2 = agent.to_local(target_pos)
		
		if target_pos_to_local.y >= up_min or target_pos_to_local.y <= down_max:
			print("Target is within up and down constraints")
			return SUCCESS
	
	return FAILURE
