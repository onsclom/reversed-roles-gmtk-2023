extends KinematicBody2D


onready var rotation_node = get_node("RotationNode")
onready var visual_char = get_node("RotationNode/VisualChar")

var grav_reversed = false
var gravity_rotation = 0
var velocity = Vector2(0, 0)
var drag_coefficient = 0.01


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		gravity_rotation += 0.05
	if Input.is_action_pressed("ui_right"):
		gravity_rotation -= 0.05

	if Input.is_action_just_pressed("toggle_gravity"):
		grav_reversed = !grav_reversed
		

	# add gravity
	velocity -= velocity * drag_coefficient
	velocity += Vector2(0, 2).rotated(gravity_rotation if !grav_reversed else gravity_rotation + PI)
	
	velocity = move_and_slide(velocity)
		
func _process(delta):
	rotation_node.rotation = gravity_rotation
	visual_char.velocity = velocity.rotated(-gravity_rotation)

