extends Node
@onready var tertius = $".."
@onready var timer = $"../Timer"


@onready var hearts = [
	$"1",
	$"2",
	$"3",
	$"4"
]

var hp = 4
var max_hp = 4

func _ready():
	hp = max_hp
	up_hp()
func _process(delta):
	pass
	up_hp()
	if Input.is_action_just_pressed("hurt"):
		hurt()
	if hp == 0:
		tertius.final_death()
		hp = -1
		timer.start(4)
		
func up_hp():
	
	for i in range(max_hp):
		hearts[i].visible = i < hp



func hurt():
	if hp > 0:
		print('hi')
		hp -= 1
		up_hp()
		print("Hurt! New HP: ", hp)


func heal():
	if hp < max_hp:
		hp += 1
		print("Heal! New HP: ", hp)

# Ensure to add these actions in the Input Map settings in Godot:
# 1. "heal" action for the "a" key
# 2. "hurt" action for the "s" key


func _on_body_body_entered(body):
	pass # Replace with function body.
	print(body)
	pass # Replace with function body.
	if body.is_in_group("trap"):
		hurt()
