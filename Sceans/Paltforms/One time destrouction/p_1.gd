extends CharacterBody2D

@onready var pt = $"."
@onready var fall_untill = $"fall untill"
@onready var timer = $Timer
@onready var anim = $AnimationPlayer
@onready var body = $CollisionShape2D
@onready var timer_2 = $Timer2

var is_falling = false
var move = 0
var fall = false
var Sp = Vector2() # Starting position as a Vector2
var reset = false
var switch = true
var motion = Vector2()

func _ready():
	Sp = pt.position
	# Start with the platform disabled
	fall = false
	is_falling = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		anim.play("shake") # Corrected the animation name
		timer.start(2)

func _process(delta):
	if fall:
		disable()

func set_pos():
	pt.position = Sp # Reset the platform to its original position
	anim.play("idle")
	fall = false
	allow() # Enable the platform when setting the position

func allow():
	pt.visible = true
	body.disabled = false

func disable():
	pt.visible = false
	body.disabled = true

func _on_timer_timeout():
	fall = true

