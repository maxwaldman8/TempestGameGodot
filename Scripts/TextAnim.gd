extends RichTextLabel

## Text to display
@export_multiline var _text: String = ""
## Speed in characters per second
@export_range(0.1, 50) var _speed: float = 10

var time = 0.0

func reset_animation():
	time = 0.0

func _process(delta):
	var regex = RegEx.new()
	regex.compile("\\[.*?\\]")
	if time * _speed >= regex.sub(_text, "", true).length(): return
	text = ""
	var in_tag = false
	var tag_text = ""
	var text_index = 0
	var i = 0
	while i < time * _speed:
		if _text[text_index] == "[" and not in_tag: in_tag = true
		if not in_tag:
			text += _text[text_index]
			i += 1
		else:
			tag_text += _text[text_index]
		if _text[text_index] == "]" and in_tag:
			text += tag_text
			tag_text = ""
			in_tag = false
		text_index += 1
	time += delta
