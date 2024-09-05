extends Node3D


var blend = -1
var caloriesBurned = 0


@onready var time = $right/Skeleton3D/watch/watch/time
@onready var calories = $right/Skeleton3D/watch/watch/calories

@onready var animation_player = $"../AnimationPlayer"
@onready var animation_tree = $AnimationTree

func _process(delta):
	if Input.is_action_pressed("watch"):
		blend = lerp(float(blend),float(1),.1)
		animation_tree.set("parameters/BlendSpace1D/blend_position",blend)
	else:
		blend = lerp(float(blend),float(-1),.2)
		animation_tree.set("parameters/BlendSpace1D/blend_position",blend)
		
	var input_dir = Input.get_vector("left","right","forward","back")
	
	if input_dir != Vector2(0,0):
		caloriesBurned += .01
		print(caloriesBurned)
		
	calories.text = "calories burned:\n" + str(round(caloriesBurned))
	time.text = "time: " + str(Time.get_datetime_string_from_system()).substr(11,15)
