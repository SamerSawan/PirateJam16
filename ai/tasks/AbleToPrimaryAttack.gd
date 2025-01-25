extends BTCondition

## Is able to primary attack?

func _tick(delta: float) -> Status:
	if agent is Creature:
		var _agent : Creature = agent
		var enemies_in_range = _agent.primary_attack.attack_range.get_enemies_in_range()
		if enemies_in_range.size() > 0:
			print("Enemies in range of Primary Attack: " + str(enemies_in_range))
			print("Able to primary attack")
			return SUCCESS
	return FAILURE
