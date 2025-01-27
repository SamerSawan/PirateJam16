extends BTAction

@export var speed_modifier : Utils.SPEED_MOD_KEY = Utils.SPEED_MOD_KEY.NORMAL
var speed_mod : float = Utils.SPEED_MOD[speed_modifier]

func _tick(delta: float) -> Status:
	if agent is Creature:
		var next_pos : Vector2 = agent.navigation_agent.get_next_path_position()
		if not next_pos:
			return FAILURE
		var direction_of_next_nav_point = agent.global_position.direction_to(next_pos).normalized()
		#print("Direction of next nav point: " + str(direction_of_next_nav_point))
		if agent.has_signal("input_move"):
			agent.input_move.emit(delta, direction_of_next_nav_point, agent.stats_component.cur_speed * speed_mod)
		#print("\n")
		#print("Navigating to target")
		#print("\n")
		return SUCCESS
	return FAILURE
