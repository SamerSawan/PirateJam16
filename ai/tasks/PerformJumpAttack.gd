extends BTAction

func _tick(delta) -> BT.Status:
	agent.perform_jump_attack()
	return SUCCESS
