extends BTCondition

## Is able to primary attack?

func _tick(delta: float) -> Status:
	var enemies_in_range = agent.primary_attack.attack_range.get_enemies_in_range()
	if enemies_in_range.size() > 0:
		print("Able to primary attack")
		return SUCCESS
	return FAILURE
