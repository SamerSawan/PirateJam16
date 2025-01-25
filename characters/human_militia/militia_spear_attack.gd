extends Attack
class_name MilitiaSpearAttack

signal change_orientation

@export var orientation_handler : OrientationHandler

func _ready() -> void:
	trigger.connect(_on_trigger)

func _on_trigger(enemy : Creature):
	change_orientation.emit(self.global_position.direction_to(enemy.global_position))
