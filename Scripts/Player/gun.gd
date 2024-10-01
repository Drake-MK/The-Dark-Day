extends Sprite2D
@onready var beam = $beam

func laser():
	beam.attack()
