extends BTCondition

## Is able to primary attack?

func _tick(delta: float) -> Status:
	if agent is Creature:
		var _agent : Creature = agent
		if _agent.current_enemy_direction is Vector2:
			return SUCCESS
	return FAILURE
