class_name PlatformerCharacter2D
extends MovementController2D

# This script is specifically for things that any character in the game needs (mobs, player, enemies, npcs, allies, etc)

signal direction_changed(direction : Vector2)

@export_range(0, 300, .2, "or_greater") var jump_force : float = 300.0

var direction : Vector2 :
	set(value):
		if direction == value:
			return
		direction = value
		direction_changed.emit(direction)

func _apply_gravity(delta: float):
	velocity.y += get_gravity().y * delta

func jump() -> void:
	if is_on_floor():
		velocity.y -= jump_force
