extends Area2D

@onready var tertius = $"../../../../First setup/Tertius"

@export var platform_paths = [] # Array of paths to the platforms
@onready var textbox = tertius.get_node("Camera2D/Text box Holder/Text Box")
@onready var textholder = tertius.get_node("Camera2D/Text box Holder")

var platforms = []
var Cp_1 = false # Track if the player is inside the interaction area

func _ready():
	for path in platform_paths:
		var platform = get_node(path)
		platforms.append(platform)

func _input(event):
	if Cp_1 and event.is_action_pressed("ui_interact"): # Check if the player presses the interact key
		interact()

func interact():
	for platform in platforms:
		platform.set_pos() # Make the platform visible and reset its position
		platform.set_process(true) # Enable platform processing
		platform.fall = false
		platform.is_falling = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		textbox.text = "Press X to Interact"
		textholder.visible = true
		Cp_1 = true # Player is now inside the interaction area

func _on_body_exited(body):
	if body.is_in_group("player"):
		textbox.text = ""
		textholder.visible = false
		Cp_1 = false # Player has left the interaction area
