extends Node3D

var player

@onready var debugVector = $debugVector
@onready var debugVector2 = $debugVector2

var platform = preload("res://_misc/platforms/grass.tscn") 


var centerToPlayer
var active = false
var sign = 1
var parent

var size = 124.72

# This is probably stupid
@onready var north = $north.global_position
@onready var northeast = $northeast.global_position
@onready var east = $east.global_position
@onready var southeast = $southeast.global_position
@onready var south = $south.global_position
@onready var southwest = $southwest.global_position
@onready var west = $west.global_position
@onready var northwest = $northwest.global_position

# New solution
var platform_dict = {
	"north": null,
	"northeast": null,
	"east": null,
	"southeast": null,
	"south": null,
	"southwest": null,
	"west": null,
	"northwest": null
}

var direction_dict

func _ready():
	active = false
	parent = get_parent()
	direction_dict = {
	"north": north,
	"northeast": northeast,
	"east": east,
	"southeast": southeast,
	"south": south,
	"southwest": southwest,
	"west": west,
	"northwest": northwest
	}

func _process(delta):
	
	# This entire solution is kind of cursed
	if active:
		for direction in direction_dict:
			if (Globals.player_position - direction_dict[direction]).length() <= 300:
				if !(direction_dict[direction] in parent.platform_dict.keys()) and Globals.active_platform <= 1:
					
					var platform = platform.instantiate()                # Instantiate a platform
					platform.global_position = direction_dict[direction] # Set the global pos
					platform_dict[direction] = platform                  # Add to local dictionary 
					
					parent.platform_dict[direction_dict[direction]] = platform #
					parent.add_child(platform_dict[direction])                 # 



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "player":
		active = true
		Globals.active_platform += 1 


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "player":
		active = false
		Globals.active_platform -= 1
