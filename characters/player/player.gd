class_name Player
extends PlatformerCharacter2D

# This script is specifically for player related stuff

@export_range(0, 100, 0.2, "or_greater") var move_speed : float = 120.0

var current_form_index: int = 0
var forms: Array[Sprite2D] = []

func _ready():
	for child in get_children():
		if child is Sprite2D:
			forms.append(child)
	
	update_form_visibility()


func _physics_process(delta: float) -> void:
	velocity = move_speed * direction.normalized()
	move_and_slide()
	
func swap_form():
	current_form_index = (current_form_index + 1) % forms.size()
	update_form_visibility()

func update_form_visibility():
	for i in range(forms.size()):
		forms[i].visible = (i == current_form_index) 
		print("Switched to form:", current_form_index)
