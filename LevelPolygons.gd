extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# get all Polygon2D children
	var polygons = get_children()
	for polygon in polygons:
		var body = CollisionPolygon2D.new()
		body.polygon = polygon.polygon
		body.position = polygon.position
		add_child(body)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
