extends Node

func spawn_debug_cross_shape(target_pos: Vector2):
	var debug_shape = DebugCrossShape.new()
	debug_shape.target_pos = target_pos
	if get_tree().root.is_node_ready():
		get_tree().root.add_child(debug_shape)
