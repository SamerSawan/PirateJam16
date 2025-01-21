extends BTAction

# Primary attackkkkk

var _agent : Creature
func _enter() -> void:
	if agent is Creature:
		_agent = agent

func _tick(delta: float) -> Status:
	if agent and _agent.current_enemy_direction:
		_agent.primary_attack.trigger.emit(_agent.current_enemy_direction)
		print("\n")
		print("primary attack success")
		print("\n")
		return SUCCESS
	return FAILURE
