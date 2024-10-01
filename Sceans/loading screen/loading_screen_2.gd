extends Node

@onready var progress_bar = $ProgressBar

var pro = []  # Holds the loading progress
var scene_path = "res://Sceans/Sprites/NPC ITEMS/Level 2.tscn"
var status = 0
var allow_loading = false

func _ready():
	allow_loading = false
	start_threaded_loading()

# Start the threaded resource loading process
func start_threaded_loading():
	ResourceLoader.load_threaded_request(scene_path)
	allow_loading = true

func _process(delta):
	if allow_loading:
		status = ResourceLoader.load_threaded_get_status(scene_path, pro)

		# Ensure we have a progress value
		if pro.size() > 0:
			progress_bar.value = int(pro[0] * 100)

		# Check if the resource is fully loaded
		if status == ResourceLoader.THREAD_LOAD_LOADED:
			var loaded_scene = ResourceLoader.load_threaded_get(scene_path)

			# Ensure the scene is valid before switching
			if loaded_scene != null:
				# Wait until the next idle frame to change the scene
				call_deferred("_change_scene", loaded_scene)

# Change the scene on an idle frame
func _change_scene(loaded_scene):
	get_tree().change_scene_to_packed(loaded_scene)
