extends KinematicBody2D

export (float) var speed = 50

var target = Vector2()
var velocity = Vector2()
var selected = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed('click') and selected:
		target = get_global_mouse_position()
	
		selected = false

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
	
	handle_selected()

func handle_selected():
	var shader := $Area2D/Polygon2D.material as ShaderMaterial
	shader.set_shader_param("intensity", 0.1 if selected else 0.0)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
		and event.button_index == BUTTON_LEFT \
		and event.is_pressed():
			selected = !selected
			if selected:
				print("SELECTED")
			else:
				print("UNSELECTED")
