extends CharacterBody2D

@export
var speed = 100.0

func _physics_process(_delta):
	var horizontal = Input.get_axis("left", "right")
	find_child("Sprite2D").flip_h = 0 if horizontal > 0 else (find_child("Sprite2D").flip_h if horizontal == 0 else 1)
	var vertical = Input.get_axis("up", "down")
	if horizontal:
		velocity.x = horizontal * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if vertical:
		velocity.y = vertical * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()
