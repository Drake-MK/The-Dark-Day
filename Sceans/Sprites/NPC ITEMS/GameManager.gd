extends Node
@onready var tertius = $"../Tertius"
@onready var board = $"../Dummy Collision/Board"



var death = global.death
var textbox = null
var textholder = null
var entered = false
var dailogue = false

# or
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	Dialogic.start("First")
	# Get the text box and text holder.
	textbox = tertius.get_node("Camera2D/Text box Holder/Text Box")
	textholder = tertius.get_node("Camera2D/Text box Holder")

	# Initialize the text box and hide the text holder.
	if textbox != null:
		textbox.text = ""
	if textholder != null:
		textholder.visible = false
		
func show_potrait(potrait):       #  For showing the potrait 
	potrait.visible = true        #  over the dailogues
func hide_potrait(pottrait):
	pottrait.visible = false

func _process(delta):
	pass
	
	if entered == true:
		if Input.is_action_just_pressed("enter"):
			var loadingScreen = load("res://Sceans/loading screen/loading_screen_2.tscn")
			get_tree().change_scene_to_packed(loadingScreen)


# Script for the pallellayer door



func _on_board_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = true
		textbox.text = "                  'Ruins -->
		<-- Industrial Area 
"
	
	


func _on_board_2_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = true
		textbox.text = " ! Industrial Lava below ! "


func _on_board_2_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		if textbox != null:
			textbox.text = ""
		if textholder != null:
			textholder.visible = false


func _on_board_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		if textbox != null:
			textbox.text = ""
		if textholder != null:
			textholder.visible = false


func _on_paraller_door_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = true
		textbox.text = " ! Press enter to travel through the paraller door "
		entered = true

func _on_paraller_door_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		if textbox != null:
			textbox.text = ""
		if textholder != null:
			textholder.visible = false
		entered = false



		
			


func _on_second_d_area_entered(area):
	pass # Replace with function body.
