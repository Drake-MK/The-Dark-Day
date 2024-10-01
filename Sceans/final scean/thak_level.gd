extends Node2D
@onready var ganim = $"global animation"

func _ready():
	ganim.play("base")
	Dialogic.start("final_dia")	
