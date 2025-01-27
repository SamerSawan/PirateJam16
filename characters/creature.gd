extends CharacterBody2D
class_name Creature

@export var root_sprite : Sprite2D
@export var stats_component : StatsComponent
@export var movement_component : MovementComponent
@export var navigation_agent : NavigationAgent2D
@export var navigation_component : NavigationComponent

@export_category("Atlas")
@export var atlases : Array[Texture2D]  ## setting these to atlas texture breaks the animation for some reason, so dont do that
@export var random_atlas : bool = true

## Movement
var direction : Vector2

@export_category("Attacks")
@export var primary_attack : Attack
@export var secondary_attack : Attack

signal input_move ## Emitted when we want creature to move in a specified direction
signal input_attack_first ## Emitted when we want creature to attack with varargs for any needed data
signal input_attack_second ## Emitted when we want creature to attack with varargs for any needed data

signal change_orientation # Orientation handler is not guaranteed but signal will exist regardless

func _ready():
	input_move.connect(func(delta, direction, speed):
		movement_component.move(delta, direction, speed)
		change_orientation.emit(direction)
	)
	
	input_attack_first.connect(func(enemy):primary_attack.trigger.emit(enemy))
	input_attack_second.connect(func(enemy):secondary_attack.trigger.emit(enemy))
	
	if random_atlas:
		_randomize_atlas_type()

func _randomize_atlas_type():
	root_sprite.set_texture(atlases.pick_random())
