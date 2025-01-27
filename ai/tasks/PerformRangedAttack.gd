extends BTAction

func _tick(delta) -> BT.Status:
	agent.perform_ranged_attack()
	return SUCCESS
