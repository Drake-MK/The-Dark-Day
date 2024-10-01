extends Node

var pro = []
var Sname
var status = 0
@onready var progress_bar = $ProgressBar

func _ready():
	Sname = "res://Sceans/Sprites/NPC ITEMS/first_level.tscn"
	ResourceLoader.load_threaded_request(Sname)


func  _process(delta):
	status = ResourceLoader.load_threaded_get_status(Sname,pro)
	progress_bar.value = int(pro[0]*100)
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var scean = ResourceLoader.load_threaded_get(Sname)
		get_tree().change_scene_to_packed(scean)
