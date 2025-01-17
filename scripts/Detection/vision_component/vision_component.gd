extends Node2D
class_name VisionComponent

## Hook to sees_target signal to detect whatever u need
## Edit children if needed
signal sees_target

@export var vision_area_2d : Area2D
@export var detection_raycaster : DetectionRaycaster

@export var vision_distance : float = 100 ## Distance of vision
@export var target_layers : Array[int] ## What layer is your target on
@export var occlusion_layers : Array[int] ## Which layers occlude vision, (walls, etc.)

func _ready():
	$Area2D/CollisionShape2D.get_shape().radius = vision_distance
	for layer in target_layers:
		vision_area_2d.set_collision_mask_value(layer, true)
	detection_raycaster.collision_layers = target_layers + occlusion_layers
	detection_raycaster.is_colliding_with_target.connect(_is_colliding_with_target)

func _is_colliding_with_target(raycast, target):
	sees_target.emit(raycast, target)
