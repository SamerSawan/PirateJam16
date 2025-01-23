extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boss_trigger_area_body_entered(body: Node2D) -> void:
	SignalBus.bossTriggered.emit()


func _on_boss_trigger_area_body_exited(body: Node2D) -> void: #just to test fogwall and stuff
	SignalBus.bossReset.emit()
