extends BTAction

## PrimaryAttack
## attached trigger_finished signal

@export var bb_target_pos : StringName = &"target_pos"

func _tick(delta: float) -> Status:
	if agent is Creature and agent.primary_attack:
		if blackboard.has_var(bb_target_pos):
			agent.primary_attack.trigger.emit(blackboard.get_var(bb_target_pos))
			print("Primary attack triggered")
			return SUCCESS
	return FAILURE
