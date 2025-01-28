extends CharacterBody2D

@export var speed = 150
@export var health = 200

@onready var boss_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var attack_box: Area2D = $AttackBox

@export var hsm: LimboHSM
@export var phase1: LimboState
@export var phase2: LimboState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_state_machine()


func _init_state_machine():
	hsm.add_transition(phase1, phase2, &"phase2_started")
	
	hsm.initial_state = phase1
	
	hsm.initialize(self)
	hsm.set_active(true)

func perform_melee_attack():
	print("attempting melee attack")

func perform_ranged_attack():
	print("attempting ranged attack")

func perform_jump_attack():
	print("attempting jump attack")
	#Play jump animation
	
	var player = get_tree().get_nodes_in_group("player")[0]
	
	var jump_target = player.global_position
	
	var tween = create_tween()
	tween.tween_property(self, "global_transform:origin", jump_target, 0.5)
	
	await tween
	
	#play land animation
	
	var players_in_area = $AttackBox.get_overlapping_bodies
	for p in players_in_area:
		player.take_damage(15)
