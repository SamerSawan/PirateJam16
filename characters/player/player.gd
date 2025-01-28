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
	
	update_old_form()

func _physics_process(delta: float) -> void:
	velocity = move_speed * direction.normalized()
	move_and_slide()
	
func swap_form():
	current_form_index = (current_form_index + 1) % forms.size()
	update_old_form()

func update_old_form():
	for i in range(forms.size()):
		forms[i].visible = (i == current_form_index) 
		print("form numba:", current_form_index)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swap_form"):
		swap_form()

func _on_corpse_add_form(texture: Texture):
	var new_sprite = Sprite2D.new()
	new_sprite.texture = texture
	new_sprite.visible = false
	add_child(new_sprite)
	forms.append(new_sprite)
	print("signal test:")
