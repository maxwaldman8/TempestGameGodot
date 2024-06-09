extends Node

@export_multiline
var _dialogue: String

var dialogue: PackedStringArray:
	get: return _dialogue.split("\n\n")

var index = 0

func _process(_delta):
	if index >= dialogue.size() or dialogue[index] == "":
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
	if find_child("DialogueBox").visible == false: return
	index += 1
	if index >= dialogue.size(): return
	find_child("Dialogue", true).reset_animation()
