extends Node
@onready var anim = $AnimationPlayer
func _ready():
	anim.play("fakes")
