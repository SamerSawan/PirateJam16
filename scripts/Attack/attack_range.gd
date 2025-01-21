extends Node2D
class_name AttackRange

signal enemy_in_range(target : Node)
signal friendly_in_range(target : Node)

@export var user : Creature

@export var attack : Attack
@export var attack_area : Area2D ## Area that we detect if enemies are within range of attack, if they are, send target_in_range signal

func _ready() -> void:
	attack_area.area_entered.connect(_on_body_entered)

func _on_body_entered(node : Node):
	if node is Creature:
		var user_team = GameState.get_first_team_of_node(user)
		var friendlies = GameState.get_friendly_to_team(user_team)
		var hostiles = GameState.get_hostile_to_team(user_team)
		var node_team = GameState.get_first_team_of_node(node)
		if node_team in hostiles:
			enemy_in_range.emit(node)
		if node_team in friendlies:
			friendly_in_range.emit(node)
