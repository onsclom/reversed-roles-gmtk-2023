extends Node2D

# preload Triangle
var triangle = preload("res://Triangle.tscn")

const grid_size = 15
const spacing = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(grid_size):
		for y in range(grid_size):
			var instance = triangle.instance()
			instance.position = Vector2((x - grid_size/2) * spacing, (y - grid_size/2) * spacing)
			add_child(instance)
