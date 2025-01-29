extends BTAction

## Creates a charging behavior by setting target pos to a specified amt of tiles behind target based on agents direction to target_pos

@export var bb_target_pos : StringName = &"charge_target_pos"
@export var behind_target_distance : float = 20

func _tick(delta: float) -> Status:
	if agent is Creature:
		if blackboard.has_var(bb_target_pos):
			var target_pos = blackboard.get_var(bb_target_pos)
			if target_pos is Vector2:
				var direction_to_target = agent.global_position.direction_to(target_pos)
				
				var offset = direction_to_target * behind_target_distance
				var new_target_pos = target_pos + offset
				
				var nav_comp : NavigationComponent = agent.navigation_component
				nav_comp.set_target_position_safely(new_target_pos)
				#print("Nav agent going to target pos: " + str(target_pos))
				return SUCCESS
	return FAILURE
