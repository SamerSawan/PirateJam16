extends BTCondition

func _tick(delta: float) -> Status:
	if agent is Creature:
		if agent.home:
			if agent.home.is_away_from_home(agent):
				return SUCCESS
	return FAILURE
