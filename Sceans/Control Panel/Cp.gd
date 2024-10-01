extends Node2D
@onready var anim = $AnimationPlayer
@onready var cp = $cp
@onready var on_2 = $on2
@onready var on = $on
@onready var timer = $Timer

func _ready():
	anim.play("idle")
	
func idle_on():
	cp.visible = true
	on.visible = false
	on_2.visible = false
	anim.play("idle")	
func idle_off():
	cp.visible = false
	on.visible = true
	on_2.visible = false
	anim.play("on")
func stay_on():
	cp.visible = false
	on.visible = false
	on_2.visible = true
	anim.play("stay on")
func return_blue():
	timer.start(5)
	pass
func _on_timer_timeout():
	pass # Replace with function body.
	anim.play("idle")


func _on_in_body_entered(body):
	pass # Replace with function body.
