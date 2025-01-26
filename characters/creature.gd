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

@export_category("Attacks")
@export var primary_attack : Attack
@export var secondary_attack : Attack

@export var is_friendly_fire : bool = false

func _ready():
	if random_atlas:
		_randomize_atlas_type()
	# duplicate code bc may change in the future, we shall see
	if primary_attack:
		primary_attack.attack_range.enemy_in_range.connect(func(enemy):
			#current_enemy_direction = global_position.direction_to(enemy.global_position)
			pass
		)
	if secondary_attack:
		secondary_attack.attack_range.enemy_in_range.connect(func(enemy):
			#current_enemy_direction = global_position.direction_to(enemy.global_position)
			pass
		)

func _randomize_atlas_type():
	root_sprite.set_texture(atlases.pick_random())
