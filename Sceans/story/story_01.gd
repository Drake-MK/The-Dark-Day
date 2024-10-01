extends Node
@onready var timer = $Timer
@onready var timer_2 = $Timer2

@onready var anim = $AnimationPlayer

func _ready():
	timer.start(35.2)
	anim.play("story")	
	
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		anim.play("dream")
		timer_2.start(5.5)

func _on_timer_timeout():
	pass # Replace with function body.
	anim.play("dream")
	timer_2.start(5)


func _on_timer_2_timeout():
	pass # Replace with function body.
	var loadingScreen = load("res://Sceans/loading screen/loading_screen_1.tscn")
	get_tree().change_scene_to_packed(loadingScreen)
