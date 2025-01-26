extends Attack
class_name MilitiaSpearAttack

signal change_orientation

@export var orientation_handler : OrientationHandler
@export var animation_player : AnimationPlayer

func _ready() -> void:
	trigger.connect(_on_trigger)

func _on_trigger(enemy : Creature, attack_type : StringName):
	match attack_type:
		&"PrimaryAttack":
			var pos = self.get_position()
			var enemy_direction = pos.direction_to(self.to_local(enemy.global_position))
			#print("Enemy Direction local:" + str(self.to_local(enemy_direction)))
			change_orientation.emit(enemy_direction)
			animation_player.play(attack_type)
			await animation_player.current_animation_changed
			trigger_finished.emit()
