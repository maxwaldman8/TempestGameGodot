extends Node

@export_multiline
var _dialogue: String

var dialogue: PackedStringArray

var index = 0

func _ready():
	dialogue = _dialogue.split("\n\n")

func _process(_delta):
	if index >= dialogue.size():
		find_child("DialogueBox").visible = false
		find_child("DialogueContinue").visible = false
		return
	find_child("DialogueBox").visible = true
	find_child("DialogueContinue").visible = true if Time.get_ticks_msec() % 1000 < 500 else false
	find_child("Dialogue", true)._text = dialogue[index]

func _input(event):
	if event.is_action_pressed("next"):
		continue_animation()

func continue_animation():
	index += 1
	if index >= dialogue.size(): return
	find_child("Dialogue", true).reset_animation()
