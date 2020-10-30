extends KinematicBody2D

export var size = 1.0				# constant multiplier
export var rotationSpeed = 0.5 		# radians / sec
export var velocity = Vector2()

var alive = true

const MAX_SIZE = 0.5
const MAX_ROTATION_SPEED = 0.2
const MAX_SPEED = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomizeStroid()
	print("STARTED")

# Create a random asteroid 
func randomizeStroid():
	print("RANDOM")
	size = randf()*MAX_SIZE
	apply_scale(Vector2(size, size))
	
	rotationSpeed = randf()*MAX_ROTATION_SPEED
	var direction = Vector2(randf(), randf()).normalized()
	velocity = direction * (randf() * MAX_SPEED)
	
	print(size)
	print(rotationSpeed)
	print(direction)
	print(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !alive: 
		return
		
	rotate(rotationSpeed * delta)
	move_and_collide(velocity, false, true)
