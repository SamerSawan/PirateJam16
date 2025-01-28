extends Node2D

#region Navigation
@onready var DEFAULT_RID = get_world_2d().get_navigation_map()
#endregion

#region SpeedMod
const SPEED_MOD = [
	0.3,
	0.6,
	1.0,
	1.3,
]

enum SPEED_MOD_KEY {
	IDLE,
	SLOWER,
	NORMAL,
	FASTER,
}

## Example
#@export_enum(SPEED_MOD) var selected_speed_mod: int = SPEED_MOD.NORMAL
#func _ready():
	## Use the enum value to fetch from the dictionary
	#var speed_value = SPEED_MODS[selected_speed_mod]
	#print("Selected Speed Modifier: ", selected_speed_mod, " = ", speed_value)
#endregion

## returns the closest body to a node in global_position
func get_closest_body(node : Node2D, bodies : Array[Node2D]):
	var closest_body = bodies.reduce(
		func(body1 : CharacterBody2D, body2 : CharacterBody2D):
		var distance1 = node.global_position.distance_to(body1.global_position)
		var distance2 = node.global_position.distance_to(body2.global_position)
		
		# Return the body with the smallest distance
		if distance1 < distance2:
			return body1
		else:
			return body2
	)
	return closest_body
