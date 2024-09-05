extends Node3D

var grass = preload("res://_misc/platforms/grass.tscn")

@onready var starting = $grass

var platform_dict = {}
var platforms = 1

func _ready():
	platform_dict[starting.global_position] = starting
