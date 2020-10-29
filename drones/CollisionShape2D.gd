extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var is_mouse_hovered = false
# ..
func _area2D_mouse_entered(): # after connecting the signal to whatever
	is_mouse_hovered = true
func _area2D_mouse_exited(): # again, after connecting it
	is_mouse_hovered = false
