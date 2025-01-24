extends Attack
class_name MilitiaSpearAttack

signal change_orientation

@export var orientation_handler : OrientationHandler

func _ready() -> void:
	trigger.connect(_on_trigger)

func _on_trigger(direction : Vector2) -> void:
	change_orientation.emit(direction)
