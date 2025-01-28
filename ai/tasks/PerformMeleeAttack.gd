extends BTAction

func _tick(delta) -> BT.Status:
	agent.perform_melee_attack()
	return SUCCESS
