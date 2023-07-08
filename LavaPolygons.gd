extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# load DeathParticles.tscn
var DeathParticles = preload("res://DeathParticles.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	# get all Polygon2D children
	var polygons = get_children()
	for polygon in polygons:
		var body = CollisionPolygon2D.new()
		body.polygon = polygon.polygon
		body.rotation = polygon.rotation
		body.position = polygon.position
		body.scale = polygon.scale
		add_child(body)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LavaPolygons_body_entered(body):
	# instantiate particles at the player's position
	var particles = DeathParticles.instance()
	particles.position = body.position
	# add particles in current scene
	add_child(particles)
	particles.emitting = true

	print("TOUCHED LAVA")
	SceneManager.lose_level_and_reset()


	pass # Replace with function body.
