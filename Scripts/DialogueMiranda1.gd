extends "res://Scripts/DialogueCharacter.gd"

@export
var speed: float = 100

var cloak = true
var sitting = false

func _process(delta):
	if get_parent().find_child("GUI").find_child("Dialogue").index == 7:
		flip_h = 1
		find_child("DialogueIndicator").visible = true
		
	if get_parent().find_child("GUI").find_child("Dialogue").index == 9 and not sitting:
		if position.x < 0:
			position.x += speed * delta
		elif position.y > 5:
			position.y -= speed * delta
		else: sitting = true
	
	if get_parent().find_child("GUI").find_child("Dialogue").index == 9 and sitting:
		find_child("DialogueIndicator").visible = true
		
	if get_parent().find_child("GUI").find_child("Dialogue").index == 8 and cloak:
		get_parent().find_child("GUI").find_child("Dialogue").index == 7
		
	if get_parent().find_child("GUI").find_child("Dialogue").index == 10 and not sitting:
		get_parent().find_child("GUI").find_child("Dialogue").index == 9
		
	if abs(get_parent().find_child("Prospero").position.distance_to(position)) <= distance:
		find_child("DialogueIndicator").visible = false
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = _dialogue
		
	if abs(get_parent().find_child("Prospero").position.distance_to(position)) <= distance and get_parent().find_child("GUI").find_child("Dialogue").index == 7:
		cloak = false
		get_parent().find_child("Prospero").find_child("Sprite2D").texture = load("res://Sprites/ProsperoNoCape.png")
		find_child("DialogueIndicator").visible = false
		get_parent().find_child("GUI").find_child("Dialogue").index = 8
		get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
		
	if abs(get_parent().find_child("Prospero").position.distance_to(position)) <= distance and get_parent().find_child("GUI").find_child("Dialogue").index == 9 and sitting:
		find_child("DialogueIndicator").visible = false
		get_parent().find_child("GUI").find_child("Dialogue").index = 10
		get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
