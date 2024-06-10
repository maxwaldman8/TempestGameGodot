extends "res://Scripts/DialogueCharacter.gd"

@export
var speed: float = 100

var done = false

var moving = false
var moved = false

func _input(event):
	if event.is_action_pressed("next") and get_parent().find_child("GUI").find_child("Dialogue").index == 4 and not done:
		done = true
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = ""
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
		moving = true
		flip_h = false
		get_parent().find_child("Miranda").flip_h = false
	if event.is_action_pressed("Summon") and moved and not get_parent().find_child("Ariel").summoned and not get_parent().find_child("Ariel").summoning:
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = ""
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		get_parent().find_child("Ariel").summon()
func _process(delta):
	if not done:
		if abs(get_parent().find_child("Prospero").position.distance_to(position)) <= distance:
			find_child("DialogueIndicator").visible = false
			get_parent().find_child("GUI").find_child("Dialogue")._dialogue = _dialogue
		
		if get_parent().find_child("GUI").find_child("Dialogue").index == 1:
			flip_h = true
	elif moving:
		if position.x > -200:
			position.x -= speed * delta
			get_parent().find_child("Miranda").position.x -= speed * delta
		else:
			moving = false
			moved = true
			get_parent().find_child("Miranda").flip_h = true
			get_parent().find_child("GUI").find_child("Dialogue")._dialogue = "[color=blue]Task[/color]: Summon Ariel"
			get_parent().find_child("GUI").find_child("Dialogue").index = 0
			get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
