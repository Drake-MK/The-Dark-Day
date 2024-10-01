extends Node


@onready var tim_1 = $timer/tim_1
@onready var tim_2 = $timer/tim_2
@onready var tim_3 = $timer/tim_3
@onready var tim_4 = $timer/tim_4
@onready var tim_5 = $timer/tim_5
@onready var tim_6 = $timer/tim_6



@onready var anim = $AnimationPlayer

func _ready():
	tim_1.start(1)
	
	
	
	


func _on_tim_1_timeout():
	pass # Replace with function body.
	anim.play("camera_1")
	
