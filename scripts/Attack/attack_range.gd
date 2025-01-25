extends Node2D
class_name AttackRange

#signal enemy_in_range(target : Node)
#signal enemy_left_range(target : Node)

@export var attack : Attack
@export var attack_area : Area2D ## Area that we detect if enemies are within range of attack, if they are, send target_in_range signal

#func _ready() -> void:
	#attack_area.body_entered.connect(_on_body_entered)
	#attack_area.body_exited.connect(_on_body_exited)
#
#func _on_body_entered(node : Node):
	#if node is Creature and GameState.is_user_hostile_to_node(attack.user, node):
		#enemy_in_range.emit(node)
#
#func _on_body_exited(node : Node):
	#if node is Creature and GameState.is_user_hostile_to_node(attack.user, node):
		#enemy_left_range.emit(node)

func get_enemies_in_range() -> Array[Node2D]:
	var bodies : Array[Node2D] = attack_area.get_overlapping_bodies()
	print(bodies)
	return bodies.filter(func(body): 
		return body is Creature and GameState.is_user_hostile_to_node(attack.user, body)
	)

func get_closest_enemy(node) -> Creature:
	if node is Creature:
		return Utils.get_closest_body(attack.user, node.get_overlapping_bodies())
	return
