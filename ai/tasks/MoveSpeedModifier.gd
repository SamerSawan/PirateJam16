extends BTAction

@export var speed_modifier : Utils.SPEED_MOD_KEY = Utils.SPEED_MOD_KEY.NORMAL
var speed_mod : float = Utils.SPEED_MOD[speed_modifier]

func _tick(delta: float) -> Status:
	if not blackboard.get_var("move_speed"):
		
