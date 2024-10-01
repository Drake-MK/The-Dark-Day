extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_open_zone_body_entered(body):
	pass # Replace with function body.
	if body.name == "Tertius":
		$AnimationPlayer.play("Door Open")


func _on_door_open_zone_body_exited(body):
	pass # Replace with function body.
	if body.name == "Tertius":
		$AnimationPlayer.play("Door Close")
