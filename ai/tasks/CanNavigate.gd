extends BTCondition

## If we are able to navigate

func _tick(delta: float) -> Status:
	if not agent.navigation_agent.is_navigation_finished():
		#print("\n")
		#print("Can navigate")
		#print("\n")
		return SUCCESS
	return FAILURE
