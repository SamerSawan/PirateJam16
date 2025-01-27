extends CharacterBody2D

@export var speed = 150
@export var health = 200

@onready var boss_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_box: Area2D = $AttackBox

@export var hsm: LimboHSM

func _phase1_ready():
	print("Entering phase 1")
	

func _phase1_physics_process():
	if (health < 101):
		hsm.dispatch(&"phase2_started")

func _phase2_ready():
	print("Entering phase 2")
	# Play switching to phase 2 animation

func _phase2_physics_process():
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_state_machine()


func _init_state_machine():
	hsm = LimboHSM.new()
	add_child(hsm)
	
	var phase1_state = LimboState.new().named("Phase 1").call_on_enter(_phase1_ready).call_on_update(_phase1_physics_process)
	var phase2_state = LimboState.new().named("Phase 2").call_on_enter(_phase2_ready).call_on_update(_phase2_physics_process)
	
	hsm.add_transition(phase1_state, phase2_state, &"phase2_started")
	
	hsm.initial_state = phase1_state
	
	hsm.initialize(self)
	hsm.set_active(true)

func perform_melee_attack():
	pass

func perform_ranged_attack():
	pass

func perform_jump_attack():
	pass
