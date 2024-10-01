extends CharacterBody2D
@onready var anim = $AnimatedSprite2D

func standup():
	anim.play("stand up")
func run():
	anim.play("run")
