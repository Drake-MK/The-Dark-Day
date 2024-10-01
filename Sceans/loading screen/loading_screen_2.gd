extends Node
@onready var timer = $Timer

var pro = []
var Sname
var status = 0
@onready var progress_bar = $ProgressBar
var allow = false
func _ready():
	allow = false
	timer.start(0.1)



func  _process(delta):
	if allow:		
		status = ResourceLoader.load_threaded_get_status(Sname,pro)
		progress_bar.value = int(pro[0]*100)
		if status == ResourceLoader.THREAD_LOAD_LOADED:
			var scean = ResourceLoader.load_threaded_get(Sname)
			get_tree().change_scene_to_packed(scean)


func _on_timer_timeout():
	pass # Replace with function body.
	allow = true
	Sname = "res://Sceans/Sprites/NPC ITEMS/Level 2.tscn"
	ResourceLoader.load_threaded_request(Sname)
