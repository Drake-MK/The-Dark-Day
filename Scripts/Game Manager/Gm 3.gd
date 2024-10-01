extends Node
@onready var timer_2 = $"../Timer2"
@onready var anim = $"../Tertius/time/AnimationPlayer"
@onready var last_animaytion = $"../Tertius/last animaytion"
@onready var delay = $"../delay"

@onready var tertius = $"../Tertius"
@onready var laser_box = $"../laser box"
var enemy = 0
var start = false
var count# variable so that pick up is only one timer
var want_to_pick_up_laser_gun = false  # will allow to take the laser gun
var textbox = null
var textholder = null
var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	anim.play("new_animation")
	var emitter_node = get_node("Tertius/beam/beam area")  # Replace with the correct path to the Node2D

	enemy = 0
	count = 0
	Dialogic.signal_event.connect(DialogicSignal)
	
	# Get the text box and text holder.
	textbox = tertius.get_node("Camera2D/Text box Holder/Text Box")
	textholder = tertius.get_node("Camera2D/Text box Holder")

	# Initialize the text box and hide the text holder.
	if textbox != null:
		textbox.text = ""
	if textholder != null:
		textholder.visible = false
	


func _process(delta):
	finalep()
	cheat()
	
	if want_to_pick_up_laser_gun == true:
		if Input.is_action_just_pressed("pickup"):
			inp()
	if start:
		start = false
		timer_2.start(100)
	else:
		tertius.get_node('time').text = str(int(timer_2.time_left))
	

func _on_laser_box_body_entered(body):
	pass # Replace with function body.
	textbox.text = "Press F to equip the Laser gun"
	textholder.visible = true
	want_to_pick_up_laser_gun = true  # it will now allow the pickup porcess using input

func _on_laser_box_body_exited(body):
	pass # Replace with function body.
	if textbox != null:
		textbox.text = ""
	if textholder != null:
		textholder.visible = false
func inp():
	count += 1
	if count < 2:
		
		pass
		laser_box.item_taken = true
		tertius.have_laser = true
		
func DialogicSignal(argument:String):
	if argument == 'true':
		print("timer started")
		start = true

func _on_tertius_scored():
	pass # Replace with function body.
	enemy += 1
	print("enemy died")


func finalep():
	if enemy > 12 :
		last_animaytion.play("final")
		print("played")
		enemy = 0
		
		
func lastd():
	Dialogic.start("fubal")
func lastD(): Dialogic.start("Main")
func cheat():
	if Input.is_action_just_pressed("cheat"):
		enemy = 13
		print("cheat on")

func _on_dialogic_signal(argument:String):
	print('hi')
	if argument == "final_animation":
		get_tree().change_scene_to_file("res://Sceans/final scean/thak_level.tscn")
		pass
	pass
