extends BTCooldown
class_name BTRandomCooldown

@export var min : float
@export var max : float

func _randomize_cooldown():
	duration = randf_range(min, max)
	if duration:
		print("Duration of BTRandomCooldown: %s" % str(duration))

func _tick(delta: float) -> Status:
	if not get_cooldown_state_var():
		_randomize_cooldown()
	return SUCCESS
