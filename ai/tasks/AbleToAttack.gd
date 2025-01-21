extends BTCondition

## Is able to attack?

func _tick(delta: float) -> Status:
	if agent is Creature:
		var _agent : Creature = agent
		if _agent.is_able_to_attack == true:
			return SUCCESS
	return FAILURE
