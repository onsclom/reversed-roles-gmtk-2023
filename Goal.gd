extends Area2D


export(PackedScene) var scene_file


func _ready():
	pass # Replace with function body.


func _on_Goal_body_entered(body):
	if scene_file:
		SceneManager.win_level_and_change(scene_file)
	pass # Replace with function body.
