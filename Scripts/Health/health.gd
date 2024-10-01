extends Node2D

@onready var heart = $Heart
var n = 0 
var health = 5
func _ready():
	heart.frame = n
func _process(delta):
	hurt()
	heart_to_show()
func hurt() :
	if health < 1:
		health - 1
	else :
		health  = 5
	
func heart_to_show():
	if health == 5:
		n = 0
	elif health == 0:
		n = 2
	elif health == 4:
		n = 6
	elif health == 3:
		n = 12
	elif health == 2:
		n = 18
	elif health == 1:
		n = 24
	
