extends BTAction

# Primary attackkkkk

var _agent : Creature
func _enter() -> void:
	if agent is Creature:
		_agent = agent

func _tick(delta: float) -> Status:
	if agent:
		_agent.primary_attack.trigger.emit(direction)
		return SUCCESS
	return FAILURE
