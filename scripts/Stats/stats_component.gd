extends Node
class_name StatsComponent

@export var root : Node2D

@export var can_walk : bool = true
@export var can_fly : bool = false

@export var immunity_frames_timer : Timer
@export var immunity_frames_timer_length : float = 0.5

func _ready() -> void:
	health_ready()

#region Speed
@export var max_speed : Vector2 = Vector2(128, 128) ## How many units per second this entity will be able to move, ideally
@onready var cur_speed : Vector2 = max_speed:
	set(speed):
		cur_speed = speed
#endregion

#region Health
signal health_changed

@export var max_health : int = 1
var cur_health : int = -1
var prev_health : int = -1

func health_ready():
	set_cur_health(max_health)

func set_cur_health(new_health : int) -> void:
	prev_health = cur_health
	cur_health = clamp(new_health, 0, max_health)
	health_changed.emit(cur_health, prev_health)
	#print("Health changed on " + root.name + " to " + str(cur_health))

func take_damage(damage : int):
	if immunity_frames_timer.is_stopped():
		#print(root.name + " took " + str(damage) + " damage ")
		set_cur_health(cur_health - abs(damage))
		immunity_frames_timer.start(immunity_frames_timer_length)
	#else: 
		#print("Target was immune to attack")

func heal(amount : int):
	set_cur_health(cur_health + abs(amount))

#endregion
