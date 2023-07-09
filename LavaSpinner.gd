extends Area2D


# load DeathParticles.tscn
var DeathParticles = preload("res://DeathParticles.tscn")
export var speed: float = .1
export var reversed: bool = false

func _physics_process(delta):
	if reversed:
		rotation -= speed*delta
	else:
		rotation += speed*delta

func _on_LavaSpinner_body_entered(body):
	# instantiate particles at the player's position
	var particles = DeathParticles.instance()

	# set the particles' position to the player's position
	# but use global rotations
	particles.global_position = body.global_position

	# add particles in current scene
	get_parent().add_child(particles)
	particles.emitting = true
	SceneManager.lose_level_and_reset()
