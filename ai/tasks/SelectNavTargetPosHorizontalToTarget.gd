extends BTAction

@export var bb_target : StringName = &"target"
@export var min_range : float = 20
@export var max_range : float = 40

func _tick(delta: float) -> Status:
	if agent is Creature:
		if blackboard.has_var(bb_target):
			var target : Node2D = blackboard.get_var(bb_target)
			if target:
				var nav_comp : NavigationComponent = agent.navigation_component
				if nav_comp:
					var direction_of_target : Vector2 = agent.global_position.direction_to(target.global_position) # comes normalized
					var sign_x = sign(agent.to_local(target.global_position).x)
					var new_pos : Vector2 = target.global_position + Vector2(-sign_x * randf_range(min_range, max_range), 0)
					nav_comp.set_target_position_safely(new_pos)
					print("Moving to attack target horizontally: " + str(target))
					return SUCCESS
	return FAILURE
