extends BTCondition

## Is enemy in my area

func _tick(delta: float) -> Status:
	var target = null
	if target:
		return SUCCESS
	else:
		return FAILURE
