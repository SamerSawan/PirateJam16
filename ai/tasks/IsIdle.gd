extends BTCondition



func _tick(delta: float) -> Status:
	if agent.cur_aggro_state == agent.AGGRO_STATES.IDLE:
		return SUCCESS
	else:
		return FAILURE
