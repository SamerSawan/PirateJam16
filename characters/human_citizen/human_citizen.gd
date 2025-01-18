extends Creature
class_name HumanCitizen

@onready var hsm : LimboHSM = $AggroLimboHSM
@onready var idle_state: LimboState = $AggroLimboHSM/IdleState
@onready var move_state: LimboState = $AggroLimboHSM/MoveState

@export var navigation_agent : NavigationAgent2D
@export var vision_component : VisionComponent
@export var aggro_timer : Timer

func _ready():
	#_init_state_machine()
	vision_component.sees_target.connect(_on_see_target)
	aggro_timer.timeout.connect(_on_aggro_timer_timeout)

#func _init_state_machine():
	#hsm.add_transition(idle_state, move_state, idle_state.EVENT_FINISHED)
	#hsm.add_transition(move_state, idle_state, move_state.EVENT_FINISHED)
	#
	#hsm.initialize(self)
	#hsm.set_active(true)

func _on_see_target(raycast, target):
	if target in vision_component.detection_raycaster.detection_targets:
		pass

func _on_aggro_timer_timeout():
	pass
