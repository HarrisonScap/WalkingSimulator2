extends Control

func _process(delta):
	if Input.is_anything_pressed():
		$AnimatedSprite2D.visible = false
