extends BTAction

@export var x_range : Vector2 = Vector2(-128, 128)
@export var y_range : Vector2 = Vector2(-128, 128)

func _tick(delta: float) -> Status:
	if agent is Creature:
		var target_pos : Vector2 = agent.global_position + Vector2(randf_range(x_range.x, x_range.y), randf_range(y_range.x, y_range.y))
		var nav_comp : NavigationComponent = agent.navigation_component
		nav_comp.set_target_position_safely(target_pos)
		#print(self.get_task_name() + ": Setting target position to :" + str(target_pos))
		return SUCCESS
	return FAILURE
