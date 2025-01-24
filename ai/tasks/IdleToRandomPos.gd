extends BTAction

@export var x_range : Vector2 = Vector2(-64, 64)
@export var y_range : Vector2 = Vector2(-64, 64)

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature:
		var target_pos : Vector2 = _agent.global_position + Vector2(randf_range(x_range.x, x_range.y), randf_range(y_range.x, y_range.y))
		var nav_comp : NavigationComponent = _agent.navigation_component
		nav_comp.set_target_position_safely(target_pos)
		print("Idling around")
		return SUCCESS
	return FAILURE
