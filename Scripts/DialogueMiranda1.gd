extends "res://Scripts/DialogueCharacter.gd"

@export
var speed: float = 100

var cloak = true
var sitting = false

var done = false

func _input(event):
	if event.is_action_pressed("next") and get_parent().find_child("GUI").find_child("Dialogue").index == 13:
		done = true
		get_parent().find_child("Prospero").find_child("Sprite2D").texture = load("res://Sprites/Prospero.png")
		find_child("DialogueIndicator").texture = load("res://Sprites/ZZZ.png")
		find_child("DialogueIndicator").visible = true
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = "\n\n[color=blue]Task[/color]: Summon Ariel by pressing Z"
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
	if event.is_action_pressed("Summon") and done and not get_parent().find_child("Ariel").summoned and not get_parent().find_child("Ariel").summoning:
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = ""
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		get_parent().find_child("Ariel").summon()

func _process(delta):
	if not done:
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
