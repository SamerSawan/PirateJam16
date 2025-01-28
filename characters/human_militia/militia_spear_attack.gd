extends Attack
class_name MilitiaSpearAttack

signal change_orientation

@export var orientation_handler : OrientationHandler
@export var animation_player : AnimationPlayer
@export var weapon_area : Area2D
@export var weapon_resource : WeaponResource

var is_attacking : bool = false

func _ready() -> void:
	trigger.connect(_on_trigger)
	weapon_area.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if is_attacking and body is Creature:
		if GameState.is_user_hostile_to_node(self, body):
			print("Emitting take damage signal")
			body.take_damage.emit(weapon_resource.damage)

func _on_trigger(trigger_data : Dictionary):
	if (trigger_data.target_node and trigger_data.target_node is Node2D 
	and trigger_data.attack_type and trigger_data.attack_type is StringName):
		match trigger_data.attack_type:
			&"PrimaryAttack":
				is_attacking = true
				var pos = self.get_position()
				var enemy_direction = pos.direction_to(self.to_local(trigger_data.target_node.global_position))
				#print("Enemy Direction local:" + str(self.to_local(enemy_direction)))
				change_orientation.emit(enemy_direction)
				animation_player.play(trigger_data.attack_type)
				await animation_player.current_animation_changed
				is_attacking = false
				trigger_finished.emit()
