extends "res://Scripts/DialogueCharacter.gd"

@export
var speed: float = 100

var summoned = false
var summoning = false

var leaving = false
var left = false

var done = false

func _input(event):
	if event.is_action_pressed("next") and get_parent().find_child("GUI").find_child("Dialogue").index == 2 and get_parent().find_child("Miranda").done and summoned:
		done = true
		leaving = true
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = ""
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		flip_h = 1

func _process(delta):
	if not done:
		if summoning:
			if position.x < -20:
				position.x += speed * delta
			else:
				summoning = false
				summoned = true
				get_parent().find_child("GUI").find_child("Dialogue")._dialogue = ""
				get_parent().find_child("GUI").find_child("Dialogue").index = 0
				get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
		if abs(get_parent().find_child("Prospero").position.distance_to(position)) <= distance and summoned and get_parent().find_child("GUI").find_child("Dialogue")._dialogue != _dialogue:
			find_child("DialogueIndicator").visible = false
			get_parent().find_child("GUI").find_child("Dialogue")._dialogue = _dialogue
			get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
	elif leaving:
		if position.x > -450:
			position.x -= speed * delta
		elif not left:
			left = true
			leaving = false
			get_parent().find_child("Curtain").visible = true
			get_parent().find_child("Curtain").drop()

func summon():
	if summoned or summoning: return
	summoning = true
