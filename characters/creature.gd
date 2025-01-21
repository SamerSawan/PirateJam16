extends CharacterBody2D
class_name Creature

@export var root_sprite : Sprite2D
@export var stats_component : StatsComponent
@export var movement_component : MovementComponent
@export var navigation_agent : NavigationAgent2D
@export var navigation_component : NavigationComponent

@export var primary_attack : Attack
@export var secondary_attack : Attack

@export var is_friendly_fire : bool = false

@export var current_enemy_direction : Vector2

func _ready():
	# duplicate code bc may change in the future, we shall see
	primary_attack.attack_range.enemy_in_range.connect(func(enemy):
		current_enemy_direction = global_position.direction_to(enemy.global_position)
	)
	secondary_attack.attack_range.enemy_in_range.connect(func(enemy):
		current_enemy_direction = global_position.direction_to(enemy.global_position)
	)
