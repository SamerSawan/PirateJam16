extends BTAction

## Calls movement code

@export var bb_speed_modifier : StringName = &"speed_modifier"
@export var bb_target_pos : StringName = &"target_pos"

func _tick(delta: float) -> Status:
	if agent.has_signal(&"input_move"):
		var target_pos = blackboard.get_var(bb_target_pos)
		if target_pos:
			var target_direction = agent.global_position.direction_to(target_pos)
			if target_direction and agent.stats_component:
				#print("Emitting movement signal")
				if blackboard.has_var(bb_speed_modifier):
					var speed_modifier = blackboard.get_var(bb_speed_modifier)
					agent.input_move.emit(delta, target_direction,agent.stats_component.cur_speed * speed_modifier)
				else:
					agent.input_move.emit(delta, target_direction, agent.stats_component.cur_speed)
				return SUCCESS
	return FAILURE
