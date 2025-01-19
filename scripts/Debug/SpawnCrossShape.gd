extends Node2D
class_name DebugCrossShape

@export var target_pos: Vector2
@export var shape_size: float = 16.0
@export var shape_color: Color = Color(0, 1, 0, 0.8)  # Green with some transparency
@export var lifespan : float = 2.0

func _draw():
	# Draw a cross centered at the target position
	draw_line(target_pos + Vector2(-shape_size, 0), target_pos + Vector2(shape_size, 0), shape_color, 2)
	draw_line(target_pos + Vector2(0, -shape_size), target_pos + Vector2(0, shape_size), shape_color, 2)

# Example usage
func _ready():
	await get_tree().create_timer(lifespan).timeout
	queue_free()
