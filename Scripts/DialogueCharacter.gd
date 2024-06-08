extends Sprite2D

@export
var distance: float = 5
@export_multiline
var _dialogue: String

func _process(delta):
	if get_parent().find_child("Prospero").position.distance_to(position) <= distance:
		get_parent().find_child("GUI").find_child("Dialogue")._dialogue = _dialogue
