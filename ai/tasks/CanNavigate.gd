extends BTCondition

func _tick(delta: float) -> Status:
	var _agent : CharacterBody2D = agent
	if _agent is Creature:
		if not _agent.navigation_agent.is_navigation_finished():
			#print("\n")
			#print("Can navigate")
			#print("\n")
			return SUCCESS
	return FAILURE
