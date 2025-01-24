extends BTCooldown
class_name BTRandomCooldown

@export var min_rand : float
@export var max_rand : float

func _randomize_cooldown():
	duration = randf_range(min_rand, max_rand)
	if duration:
		print("Duration of BTRandomCooldown: %s" % str(duration))

func _tick(delta: float) -> Status:
	if not get_cooldown_state_var():
		_randomize_cooldown()
	return SUCCESS
