extends Node2D
@onready var beam = $"."

@onready var anim = %AnimationPlayer





signal score



func _on_area_entered(area):
	pass # Replace with function body.
	
	if area.is_in_group("enemy"):
		emit_signal("score")
		area.queue_free()


func _on_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group("enemy"):
		emit_signal("score")
		body.get_tree().queue_free()



