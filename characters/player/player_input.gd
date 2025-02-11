class_name PlayerInput
extends Node

# This script is specifically for player input related stuff

@export var player : Player
@export var actions : PlayerInputActions


func _process(delta: float) -> void:
	player.direction = Input.get_vector(actions.left, actions.right, actions.up, actions.down)
