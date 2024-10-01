extends Area2D
@onready var box = $box
@onready var collision_shape_2d = $CollisionShape2D

@onready var animation_player = $AnimationPlayer

var item_taken = false

func _process(delta):
	
	if item_taken == true:
		animation_player.play("box burst")
		item_taken = false
		queue_free()
func _on_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		animation_player.play("box open")


func _on_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		animation_player.play("box close")
		

