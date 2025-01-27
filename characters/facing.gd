class_name Facing
extends Node2D

# This script is for facing logic and can be used with any of the characters. See the player scene to see how to use it

@export var character : Node2D :
	set(value):
		if is_instance_valid(character):
			character.direction_changed.disconnect(_on_direction_changed)
			
		character = value
		
		if is_instance_valid(character):
			character.direction_changed.connect(_on_direction_changed)

func _on_direction_changed(p_direction : Vector2):
	if p_direction.x == 0:
		return
	
	scale.x = abs(scale.x) * sign(p_direction.x)
