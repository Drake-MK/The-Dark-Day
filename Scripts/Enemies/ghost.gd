extends Area2D

@onready var sprite_2d = $Sprite2D
@onready var anim = $AnimationPlayer
@onready var visible_area = $"visible area/CollisionShape2D"
@onready var attack_area = $"attack area/CollisionShape2D"
@onready var fang_area_R = $"fang area R/CollisionPolygon2D"
@onready var fang_area_L = $"fang area L/CollisionPolygon2D"

var speed = 100
var target = null
var move = false
var attack = false
var inside_attack_zone = false
var death = global.death
func _ready():
	anim.play("idle")

func _process(delta):
	if move and target and not inside_attack_zone:
		anim.play("run")
		var direction = (target.global_position - global_position).normalized()
		if direction.x > 0:
			fang_area_R.disabled = false
			fang_area_L.disabled = true
			sprite_2d.flip_h = false
		elif direction.x < 0:
			fang_area_R.disabled = true
			fang_area_L.disabled = false
			sprite_2d.flip_h = true
		global_position += direction * speed * delta
	elif attack and inside_attack_zone:
		anim.play("attack")
	else:
		anim.play("idle")

func _on_visible_area_body_entered(body):
	if body.name == "Tertius":
		move = true
		target = body

func _on_visible_area_body_exited(body):
	if body.name == "Tertius":
		move = false
		target = null

func _on_attack_area_body_entered(body):
	if body.name == "Tertius":
		inside_attack_zone = true
		attack = true

func _on_attack_area_body_exited(body):
	if body.name == "Tertius":
		inside_attack_zone = false
		attack = false

func _on_fang_area_r_body_entered(body):
	if body.name == "Tertius":
		print("dead")
		death = true

func _on_fang_area_l_body_entered(body):
	if body.name == "Tertius":
		print("dead")
		
