extends BTCondition

#Are we aggro'd

func _tick(delta: float) -> Status:
	if agent.cur_state == agent.STATE.AGGRO:
		return SUCCESS
	else:
		return FAILURE
