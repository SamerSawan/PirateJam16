extends BTAction

## PrimaryAttack
## attached trigger_finished signal

func _enter() -> void:
	if agent is Creature:
		if not agent.primary_attack.trigger_finished.is_connected(_on_trigger_finished):
			agent.primary_attack.trigger_finished.connect(_on_trigger_finished)
			agent.primary_attack.trigger.emit(
				{
					"target_node": agent.primary_attack.attack_range.get_closest_enemy(agent), 
					"attack_type": &"PrimaryAttack"
				}
			)
			print("Primary attack triggered")

func _tick(delta: float) -> Status:
	if agent.primary_attack.trigger_finished.is_connected(_on_trigger_finished):
		#print("attack anim running")
		return RUNNING
	return SUCCESS

func _on_trigger_finished():
	if agent.primary_attack.trigger_finished.is_connected(_on_trigger_finished):
		agent.primary_attack.trigger_finished.disconnect(_on_trigger_finished)

func _exit() -> void:
	if agent.primary_attack.trigger_finished.is_connected(_on_trigger_finished):
		agent.primary_attack.trigger_finished.disconnect(_on_trigger_finished)
