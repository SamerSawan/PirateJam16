extends Attack
class_name MilitiaSpearStab

@export var weapon_area : Area2D
@export var weapon_resource : WeaponResource
	
## When AI attack, just trigger attack
## When player attack, trigger anim

func _ready() -> void:
	weapon_area.body_entered.connect(_check_for_collisions)

func _check_for_collisions(body : Node2D):
	if GameState.is_user_hostile_to_node(user, body):
		print("Emitting take damage signal")
		if body.stats_component.take_damage(weapon_resource.damage):
			var knockback_in_direction : Vector2 = weapon_resource.knockback * global_position.direction_to(body.global_position)
			body.movement_component.take_knockback(knockback_in_direction)
