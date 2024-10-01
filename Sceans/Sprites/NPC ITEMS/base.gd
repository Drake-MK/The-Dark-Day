extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@onready var mc_2 = $"../GameManager/Mc2"
@onready var tetranox_2 = $"../GameManager/tetranox2"


	
	
	pot = mc
	
	
	func show_potrait_once():
	mc.visible = true 
	if Input.is_action_just_pressed("enter"):
		mc.visible = false
		
		
		

	
