extends Node2D
class_name Attack

signal trigger(trigger_data : Dictionary) ## use trigger to send whatever data you need for the attack, direction, etc.
signal trigger_finished ## optional signal for when finishing trigger, mainly for use in limboai with the await animation finished

@export var user : Creature
@export var attack_range : AttackRange # Holds an area that defines where attack can be triggered

#func _ready() -> void:
	#trigger.connect(_on_trigger)

#func _on_trigger():
	#pass
