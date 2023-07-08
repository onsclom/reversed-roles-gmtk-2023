extends KinematicBody2D


onready var rotation_node = get_node("RotationNode")
onready var visual_char = get_node("RotationNode/VisualChar")
onready var hit_sound = get_node("HitSound")
onready var space_sound = get_node("SpaceSound")
onready var shakeable_camera = get_node("RotationNode/ShakeableCamera")

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
		space_sound.play()
		grav_reversed = !grav_reversed
		

	# add gravity
	velocity -= velocity * drag_coefficient
	velocity += Vector2(0, 2).rotated(gravity_rotation if !grav_reversed else gravity_rotation + PI)
	
	var old_vel = velocity
	velocity = move_and_slide(velocity)

	if old_vel.x != velocity.x or old_vel.y != velocity.y:
	
		# if difference of old and new vel is high,
		# impact must have been high...
		# play a sound!
		# AND old vel mustve been decent
		if (old_vel - velocity).length() > 20 and old_vel.length() > 20:
			hit_sound.play()
			shakeable_camera.add_stress(1)
		
func _process(delta):
	rotation_node.rotation = gravity_rotation
	visual_char.velocity = velocity.rotated(-gravity_rotation)

