extends AnimatedSprite2D

@export_multiline
var _dialogue: String

var dropping = false

func drop():
	dropping = true
	play("drop")

func _process(_delta):
	if dropping and not is_playing():
		dropping = false
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = _dialogue
		get_parent().find_child("GUI").find_child("Dialogue").index = 0
		get_parent().find_child("GUI").find_child("Dialogue").find_child("DialogueBox").find_child("Dialogue").reset_animation()
