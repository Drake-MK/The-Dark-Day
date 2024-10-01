extends Sprite2D
@onready var anima = $AnimationPlayer

func _ready():
	anima.play("boyIdle")
