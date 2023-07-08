extends Node2D

onready var left: Position2D = get_node("Left")
onready var right: Position2D = get_node("Right")
var velocity = Vector2(0, 0)

const eye_radius = 4
const pupil_radius = 1.5
const max_offset = eye_radius - pupil_radius

var left_offset = Vector2(0, 0)
var right_offset = Vector2(0, 0)

#rng
var rand = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _draw():
	rand.seed = 69

	# draw circle
	# draw_circle(Vector2(0, 0), 10, Color(0, 0, 0))

	# draw 10 random circles
	for _i in range(50):
		var r = rand.randf_range(0, 8)
		var rotation = rand.randf_range(0, PI*2)
		var x = r * cos(rotation)
		var y = r * sin(rotation)
		draw_circle(Vector2(x, y), 5, Color(0,0,0))

	draw_circle(left.position, eye_radius, Color(1,1,1))
	draw_circle(right.position, eye_radius, Color(1,1,1))

	# make eyes look in the direction we are moving
	var eyes_target = Vector2(velocity)
	var look_strength = eyes_target.length() * .03

	var left_pupil_offset_target = (eyes_target - left.position).normalized() * look_strength
	if  left_pupil_offset_target.length() > max_offset:
		left_pupil_offset_target = left_pupil_offset_target.normalized() * max_offset
	left_offset = left_offset.linear_interpolate(left_pupil_offset_target, .1)
	draw_circle(left.position + left_offset, pupil_radius, Color(0,0,0))

	var right_pupil_offset_target = (eyes_target - right.position).normalized() * look_strength
	if  right_pupil_offset_target.length() > max_offset:
		right_pupil_offset_target = right_pupil_offset_target.normalized() * max_offset
	right_offset = right_offset.linear_interpolate(right_pupil_offset_target, .1)
	draw_circle(right.position + right_offset, pupil_radius, Color(0,0,0))

func _process(delta):
	# queue redraw
	update()

