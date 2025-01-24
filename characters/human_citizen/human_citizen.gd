extends Creature
class_name HumanCitizen

signal change_orientation
@export var orientation_handler : OrientationHandler

@export var vision_component : VisionComponent
@export var aggro_timer : Timer

@export var male_atlas : Texture2D ## setting these to atlas texture breaks the animation for some reason, so dont do that
@export var female_atlas : Texture2D ## setting these to atlas texture breaks the animation for some reason, so dont do that

@export_category("Aggro State Machine")
@export var aggro_hsm : LimboHSM
@export var idle_state: LimboState
@export var aggro_state: LimboState
@export_category("")

@export var atlas_type : String = "Female"

func _ready():
	_randomize_atlas_type()
	_setup_texture_variant()
	_init_state_machines()
	vision_component.sees_target.connect(_on_see_target)
	aggro_timer.timeout.connect(_on_aggro_timer_timeout)

func _physics_process(delta: float) -> void:
	movement_component.apply_friction(delta)
	move_and_slide()

func _randomize_atlas_type():
	var rng = randi_range(0, 1)
	match rng:
		0:
			atlas_type = "Female"
		1:
			atlas_type = "Male"

func _setup_texture_variant():
	match atlas_type:
		"Female":
			root_sprite.set_texture(female_atlas)
		"Male":
			root_sprite.set_texture(male_atlas)

func _init_state_machines():
	aggro_hsm.add_transition(idle_state, aggro_state, &"aggro_start")
	aggro_hsm.add_transition(aggro_state, idle_state, &"aggro_stop")
	
	aggro_hsm.initialize(self)
	aggro_hsm.set_active(true)

func _on_see_target(raycast : RayCast2D, target : Node):
	if target in vision_component.detection_raycaster.detection_targets: # if has line of sight
		# if target is an enemy
		
		var target_team : Dictionary = GameState.get_first_team_of_node(target)
		var self_team : Dictionary = GameState.get_first_team_of_node(self)
		var enemy_teams : Dictionary = GameState.get_hostile_to_team(self_team.keys()[0])
		#print("Target- %s\n" % target_team)
		#print("	Self- %s\n" % self_team)
		#print("Enemies- %s\n" % enemy_teams)
		for team in target_team:
			if team in enemy_teams: # we are aggro'd if they are an enemy
				if not aggro_hsm.get_active_state() is AggroState: # set state to aggro start
					print("Dispatching transition to start aggro")
					aggro_hsm.dispatch(&"aggro_start")
				aggro_timer.start() # start aggro timer

func _on_aggro_timer_timeout():
	if not aggro_hsm.get_active_state() is IdleState:
		print("Dispatching transition to end aggro")
		aggro_hsm.dispatch(&"aggro_stop")
