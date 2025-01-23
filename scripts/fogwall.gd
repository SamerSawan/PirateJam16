extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("bossReset", wallDown)
	SignalBus.connect("bossTriggered", boss_triggered)
	visible = false
	set_deferred("collision_enabled", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func boss_triggered():
	visible = true
	set_deferred("collision_enabled", true)

func wallDown():
	visible = false
	set_deferred("collision_enabled", false)
