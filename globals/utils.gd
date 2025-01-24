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
