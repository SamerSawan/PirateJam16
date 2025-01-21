extends LimboHSM

@export var debug : bool = false

func _ready():
	if debug:
		var timer : Timer = Timer.new()
		get_parent().add_child.call_deferred(timer)
		await timer.ready
		timer.one_shot = false
		timer.timeout.connect(_on_timer_timeout)
		timer.start(2)

func _on_timer_timeout():
	#print(Time.get_time_string_from_system())
	print("	Active State: " + str(self.get_active_state()))
	#print("	Leaf State: " + str(self.get_leaf_state()))
