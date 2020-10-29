extends Area2D

var target = Vector2 ()
var velocity = Vector2 ()
var speed = 200

func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity = position.direction_to(target) * speed
	position += velocity * delta

func _unhandled_input(event):
	if event.is_action_pressed('gothere'):
		target = get_global_mouse_position()
