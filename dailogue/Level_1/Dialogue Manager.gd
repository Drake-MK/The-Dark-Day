extends Node
@onready var p = $"../Tertius"




func _ready():
	pass

func _process(delta):
	pass
	
		
func _on_second_d_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		Dialogic.start("second")
		
