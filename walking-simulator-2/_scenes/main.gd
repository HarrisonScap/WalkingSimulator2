extends Node3D

@onready var camera = $player/Camera3D
@onready var playerCamera = $player/head/playerCamera

var activeCamera = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	playerCamera.make_current()

func _input(event):
	if Input.is_action_pressed("closegame"):
		get_tree().quit()
	if Input.is_action_just_pressed("camera"):
		print("Swapping camera")
		if activeCamera:
			activeCamera = false
			camera.make_current()
		else:
			activeCamera = true
			playerCamera.make_current()
