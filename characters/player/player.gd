class_name Player
extends PlatformerCharacter2D

# This script is specifically for player related stuff

@export_range(0, 100, 0.2, "or_greater") var move_speed : float = 120.0



func _physics_process(delta: float) -> void:
	velocity = move_speed * direction.normalized()
	move_and_slide()
