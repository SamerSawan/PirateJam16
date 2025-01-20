extends Node2D

#region Collision Layers
enum COLLISIONLAYERS{
	GROUND,
	Layer2,
	Layer3,
	Layer4,
	PLAYER,
	ENEMY,
	FRIENDLY,
	Layer8
}
#endregion
#region Navigation
@onready var DEFAULT_RID = get_world_2d().get_navigation_map()
#endregion
