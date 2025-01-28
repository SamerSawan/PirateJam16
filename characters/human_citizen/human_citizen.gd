extends Creature
class_name HumanCitizen

@export var orientation_handler : OrientationHandler

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

func _physics_process(delta: float) -> void:
	movement_component.apply_friction(delta)
	move_and_slide()

func _init_state_machines():
	aggro_hsm.add_transition(idle_state, aggro_state, &"aggro_start")
	aggro_hsm.add_transition(aggro_state, idle_state, &"aggro_stop")
	
	aggro_hsm.initialize(self)
	aggro_hsm.set_active(true)

func _on_see_target(raycast : RayCast2D, target : Node):
	if target in vision_component.detection_raycaster.detection_targets: # if has line of sight
		if GameState.is_user_hostile_to_node(self, target):
			if not aggro_hsm.get_active_state() == aggro_state: # set state to aggro start
				print("Dispatching transition to start aggro")
				aggro_hsm.dispatch(&"aggro_start")
			aggro_timer.start() # start aggro timer

func _on_aggro_timer_timeout():
	if not aggro_hsm.get_active_state() == idle_state:
		print("Dispatching transition to end aggro")
		aggro_hsm.dispatch(&"aggro_stop")
