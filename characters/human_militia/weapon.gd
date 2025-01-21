extends Node2D
class_name Attack

@export var user : Creature

signal attack_area_entered

# Tot: do we want damage on weapon or attack.... hmmm
@export var attack_area : Area2D

func _ready() -> void:
	attack_area.area_entered.connect(_on_area_entered)

func _on_area_entered(node : Node):
	attack_area_entered.emit(self)
