extends Node
@onready var tertius = $"../First setup/Tertius"
@onready var cp = $"../Third setup/Control Panel/Cp"
@onready var anim_2 = $"../Second Setup/checkpoint/AnimationPlayer"

# for selecting all the sprites within a particular groups

var Cp_1 = false    # for making the platform appear
var textbox = null
var textholder = null
var entered = false
# Called when the node enters the scene tree for the first time.

# Platform AREAS Position 
func _ready():
	Dialogic.start("2_1")
	# Get the text box and text holder.
	textbox = tertius.get_node("Camera2D/Text box Holder/Text Box")
	textholder = tertius.get_node("Camera2D/Text box Holder")

	# Initialize the text box and hide the text holder.
	if textbox != null:
		textbox.text = ""
	if textholder != null:
		textholder.visible = false

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if entered == true:  # prss enter to change the scene
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://Sceans/loading screen/loading_screen_3.tscn")

func _on_monitor_1_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		
		textholder.visible = true
		textbox.text = " ! Human Research Lab Ahead !"


func _on_monitor_1_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = false
		textbox.text = ""

	



	


func _on_monitor_2_body_entered(body):
	pass # Replace with function body.
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = true
		textbox.text = " ! UPDATED PANEL :
			 Log 1/2/2390 : be aware of the mutated species, 
			 we were ambushed by the madScientist's virus!"


func _on_monitor_2_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = false
		textbox.text = ""


func _on_door_enter_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		textholder.visible = true
		textbox.text = " ! Press enter to travel through the paraller door "
		entered = true


func _on_door_enter_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		if textbox != null:
			textbox.text = ""
		if textholder != null:
			textholder.visible = false
		entered = false






