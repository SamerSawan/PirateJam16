extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered:
		$EButton.visible = true;
	if entered and Input.is_action_just_pressed("interact"):
		infest();

var entered = false;
func _on_area_2d_body_entered(body):
	entered = true; # Replace with function body.


func _on_area_2d_body_exited(body):
	entered = false; # Replace with function body.
func infest():
	print("infested")
