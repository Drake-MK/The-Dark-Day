extends Sprite2D
@onready var anim = $AnimationPlayer
func _ready():
	anim.play("light trail")
