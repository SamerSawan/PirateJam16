extends CharacterBody2D
class_name Creature

@export var root_sprite : Sprite2D
@export var stats_component : StatsComponent
@export var movement_component : MovementComponent
@export var navigation_agent : NavigationAgent2D
@export var navigation_component : NavigationComponent

@export var is_able_to_attack : bool = true
