extends Node2D
class_name AttackRange

signal enemy_in_range(target : Node)

@export var attack : Attack
@export var attack_area : Area2D ## Area that we detect if enemies are within range of attack, if they are, send target_in_range signal


func _ready() -> void:
	attack_area.body_entered.connect(_on_body_entered)
	attack_area.body_exited.connect(_on_body_exited)

func _on_body_entered(node : Node):
	if node is Creature:
		var user_team = GameState.get_first_team_of_node(attack.user)
		var hostiles = GameState.get_hostile_to_team(user_team)
		var node_team = GameState.get_first_team_of_node(node)
		if node_team in hostiles:
			enemy_in_range.emit(node)

func _on_body_exited(node : Node):
	if node is Creature:
		pass
