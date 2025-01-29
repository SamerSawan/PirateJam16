extends BTAction

@export var bb_target_pos : StringName = &"target_pos"

func _tick(delta: float) -> Status:
	if agent is Creature:
		if blackboard.has_var(bb_target_pos):
			var target_pos = blackboard.get_var(bb_target_pos)
			if target_pos is Vector2:
				var nav_comp : NavigationComponent = agent.navigation_component
				if nav_comp:
					nav_comp.set_target_position_safely(target_pos)
					#print("Nav agent going to target pos: " + str(target_pos))
					return SUCCESS
	return FAILURE
