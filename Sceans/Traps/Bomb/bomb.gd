extends Area2D
signal hurted
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("idle")

# Called when a body enters the Area2D
func _on_body_entered(body):
	if body.is_in_group("player"):
		anim.play("burst")
		
		
func reset():
	anim.play("idle")



func rev():
	anim.play("rev")
