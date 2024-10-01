extends Node

@onready var portal_a_2 = $PortalA2
@onready var portal_a = $PortalA
@onready var portal_b_2 = $PortalB2
@onready var portal_b = $PortalB
@onready var portal_c = $PortalC
@onready var portal_c_2 = $PortalC2
@onready var portal_d = $PortalD
@onready var portal_d_2 = $PortalD2
@onready var last_portal = $"last portal"



func _on_enter_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_a_2.position.x + 30
		body.position.y = portal_a_2.position.y 
		


func _on_exit_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_a.position.x - 30
		body.position.y = portal_a.position.y 


func _on_enter_b_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_b_2.position.x + 30
		body.position.y = portal_b_2.position.y 


func _on_exit_b_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_b.position.x 
		body.position.y = portal_b.position.y + 60


func _on_enter_c_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_b.position.x + 30
		body.position.y = portal_b.position.y 

func _on_exit_c_2_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_c.position.x 
		body.position.y = portal_c.position.y + 60


func _on_enter_d_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_d_2.position.x -40
		body.position.y = portal_d_2.position.y 

func _on_exit_d_2_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
			body.position.x = portal_d.position.x + 60
			body.position.y = portal_d.position.y 


func _on_last_exit_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		body.position.x = portal_c_2.position.x + 30
		body.position.y = portal_c_2.position.y 
