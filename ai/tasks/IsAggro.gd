extends BTCondition

##Are we aggro'd

func _tick(delta: float) -> Status:
	if agent.cur_aggro_state == agent.AGGRO_STATES.AGGRO:
		return SUCCESS
	else:
		return FAILURE
