extends BTAction

@export var speed_modifier : float = 1

var nav_agent : NavigationAgent2D
func _enter() -> void:
	nav_agent = agent.navigation_agent

## Running task that handles arriving at navigation agent target position
func _tick(delta: float) -> Status:
	if nav_agent.is_navigation_finished():
		return SUCCESS
	
	var next_pos : Vector2 = nav_agent.get_next_path_position()
	if next_pos:
		nav_agent.get_next_path_position()
		var direction_of_next_nav_point = agent.global_position.direction_to(next_pos).normalized()
		if direction_of_next_nav_point:
			agent.input_move.emit(delta, direction_of_next_nav_point, agent.stats_component.cur_speed * speed_modifier)
			return RUNNING
	
	return FAILURE
