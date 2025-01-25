extends BTAction

# Primary attackkkkk

var _agent : Creature
func _enter() -> void:
	if agent is Creature:
		_agent = agent

func _tick(delta: float) -> Status:
	_agent.primary_attack.trigger.emit(_agent.primary_attack.get_closest_enemy())
	print("Primary attack triggered")
	return SUCCESS
