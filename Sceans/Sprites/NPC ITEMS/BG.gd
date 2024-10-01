extends Node
@onready var animation_player = $NebulaRed/AnimationPlayer
func _ready():
	animation_player.play("heart_beat")
