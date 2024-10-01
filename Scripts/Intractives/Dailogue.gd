extends Node



var fist_D = false


func _ready():
	pass
	mc.visible = true
	tetranox.visible = false
	fist_D = true
	if Input.is_action_just_pressed("enter") or Input.is_action_just_pressed("shoot"):
		mc.visible = false

func _process(delta):
	pass
	if fist_D == true:
			DialogueManager.show_example_dialogue_balloon(load("res://dailogue/Level_1/fisrt D.dialogue"))
			fist_D = false
			mc.visible = false

