extends Attack
class_name MilitiaSpearStab

@export var weapon_area : Area2D
@export var weapon_resource : WeaponResource
	
## When AI attack, just trigger attack
## When player attack, trigger anim

func _check_for_collisions():
	for body in weapon_area.get_overlapping_bodies():
		if GameState.is_user_hostile_to_node(user, body):
			print("Emitting take damage signal")
			body.stats_component.take_damage(weapon_resource.damage)
			var knockback_in_direction : Vector2 = weapon_resource.knockback * user.global_position.direction_to(body.direction)
			body.movement_component.take_knockback(knockback_in_direction)
