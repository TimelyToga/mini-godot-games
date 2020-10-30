extends Node2D


# % of asteroids that are generated
export var fieldDensity = 1.0

# Spacing 
export var spacing = 500.0


# "x_y": Asteriod
var map = {}

var shuttle : KinematicBody2D = null 
const AsteroidResource = preload("res://Asteroid.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	shuttle = get_parent().get_node("Shuttle")
	
	
func move_to(newPosition: Vector2):
	if newPosition.length() == 0.0:
		return 
	
	var mapPos = (newPosition / spacing).round()
	
	# TODO: check 3x3 grid of cells around this position
	for x in [-1, 0, 1]:
		for y in [-1, 0, 1]: 
			if x == 0 and y == 0:
				continue
			
			generate(mapPos + Vector2(x, y))
	
func generate(mapCoords: Vector2):
	if map.has(mapCoords): 
		return 
		
	print("GENERATING AT ", mapCoords)
	var asteroid = AsteroidResource.instance()
	asteroid.position = mapCoords * spacing
	map[mapCoords] = asteroid
	self.add_child(asteroid)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_to(shuttle.position)
