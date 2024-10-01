extends Area2D
@onready var tertius = $"."
signal hurted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	$AnimationPlayer.play("Eletrigger")

# Called when a body enters the Area2D
func _on_body_entered(body):
	if body.name == 'Tertius':
		pass
		
		print("Dead by EleTrap")


