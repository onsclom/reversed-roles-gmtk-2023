extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#get reference to Polygon2D child
onready var polygon = $Polygon
onready var collisionShape = $CollisionPolygon2D

# make editor scriptable polygonpoints

# Called when the node enters the scene tree for the first time.
func _ready():
	# set collisionShape points from polygon points
	# collisionShape.polygon = PoolVector2Array()
	collisionShape.polygon = polygon.polygon
	# collisionShape.update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
