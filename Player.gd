extends Node2D

onready var player_body = get_node("PlayerBody")
onready var triangles = get_node("Triangles")

var gravity_rotation = 0
var grav_reversed = false

func _physics_process(delta):
	var target = player_body.gravity_rotation + PI if player_body.grav_reversed else player_body.gravity_rotation
	gravity_rotation = lerp(gravity_rotation, target, 0.1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# keep these updated using our player!
	var tris = triangles.get_children()
	# for each tri set rotation
	for tri in tris:
		tri.set_rotation(gravity_rotation)
	
	triangles.position = player_body.position

	var offset_x = fmod(player_body.position.x, triangles.spacing)
	var offset_y = fmod(player_body.position.y, triangles.spacing)
	triangles.position -= Vector2(offset_x, offset_y)
