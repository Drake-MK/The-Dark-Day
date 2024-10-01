extends Area2D

@onready var timer = $"../Timer"

# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	pass # Replace with function body.
	print("you falled")
	if body.name == "Tertius":
		
		body.get_node("CollisionShape2D").queue_free()
		timer.start(0.1)


func _on_timer_timeout():
	pass # Replace with function body.
	
	get_tree().reload_current_scene()
