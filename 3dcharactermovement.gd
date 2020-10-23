extends KinematicBody
 
var gravity = -9.8
var velocity = Vector3()
var character

# For reference
var ray_origin = Vector3()
var ray_target = Vector3()

onready var camera = $CameraRig/Camera
onready var camera_rig = $CameraRig
 
const SPEED = 6
const ACCELERATION = 3
const DECEL = 5
 
func _ready():
	   
		#camera = get_node("./Camera").get_global_transform()
		camera_rig.set_as_toplevel(true)
		character = get_node(".")
	   
#func _process(delta):
 
func _physics_process(delta):
	
		camera_follows_player()
	   
		var dir = Vector3()
	   
		var is_moving = false
	   
		if(Input.is_action_pressed("move_forward")):
				dir += Vector3(0,0,-1)
				is_moving = true
		if(Input.is_action_pressed("move_back")):
				dir += Vector3(0,0,1)
				is_moving = true
		if(Input.is_action_pressed("strafe_left")):
				dir += Vector3(-1,0,0)
				is_moving = true
		if(Input.is_action_pressed("strafe_right")):
				dir += Vector3(1,0,0)
				is_moving = true
	   
		dir.y = 0
		dir = dir.normalized()
	   
		velocity.y += delta * gravity
	   
		var hv = velocity
		hv.y = 0
	   
		var new_pos = dir * SPEED
		var accel = DECEL
	   
		if (dir.dot(hv) > 0):
				accel = ACCELERATION
			   
		hv = hv.linear_interpolate(new_pos, accel * delta)
	   
		velocity.x = hv.x
		velocity.z = hv.z
	   
		velocity = move_and_slide(velocity, Vector3(0,1,0))
	   
		if is_moving:
				var rot_acceleration = 10
				character.rotation.y = lerp_angle(character.rotation.y, atan2(-hv.x, -hv.z), delta * rot_acceleration)
			   
		
func camera_follows_player():
		var player_pos = global_transform.origin
		camera_rig.global_transform.origin = player_pos
