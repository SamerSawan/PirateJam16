extends Creature
class_name HumanCitizen

@export var navigation_agent : NavigationAgent2D
@export var vision_component : VisionComponent
@export var aggro_timer : Timer

@export_category("Aggro State Machine")
@export var aggro_hsm : LimboHSM
@export var idle_state: LimboState
@export var aggro_state: LimboState
@export_category("")

func _ready():
	_init_state_machines()
	vision_component.sees_target.connect(_on_see_target)
	aggro_timer.timeout.connect(_on_aggro_timer_timeout)

func _init_state_machines():
	aggro_hsm.add_transition(idle_state, aggro_state, &"aggro_start")
	aggro_hsm.add_transition(aggro_state, idle_state, &"aggro_stop")
	
	aggro_hsm.initialize(self)
	aggro_hsm.set_active(true)

func _on_see_target(raycast, target):
	if target in vision_component.detection_raycaster.detection_targets:
		aggro_hsm.dispatch(&"aggro_start")

func _on_aggro_timer_timeout():
	aggro_hsm.dispatch(&"aggro_stop")
