extends BTAction

@export var bb_target : StringName = &"target"
@export var bb_target_pos : StringName = &"target_pos"

func _tick(delta: float) -> Status:
	if blackboard.has_var(bb_target):
		var target : Node2D= blackboard.get_var(bb_target)
		if is_instance_valid(target):
			blackboard.set_var(bb_target_pos, target.global_position)
			return SUCCESS
	return FAILURE
