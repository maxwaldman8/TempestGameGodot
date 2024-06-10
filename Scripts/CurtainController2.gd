extends AnimatedSprite2D

@export_multiline
var _dialogue: String

var dropping = false
var dropped = false

func _ready():
	visible = true
	play("lift")

func drop():
	dropping = true
	play("drop")
	
func _input(event):
	if dropped and event.is_action_pressed("next") and get_parent().find_child("GUI").find_child("Dialogue").index == 2:
		get_tree().change_scene_to_file("res://Scenes/Part2.tscn")

func _process(_delta):
	if dropping and not is_playing():
		dropped = true
		dropping = false
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = _dialogue
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
