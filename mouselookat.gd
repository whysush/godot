# Use this in 3D player character controller
# Have spatial node "CameraRig" with Camera node

var ray_origin = Vector3()
var ray_target = Vector3()

onready var camera = $CameraRig/Camera
onready var camera_rig = $CameraRig

func _input(event):
	var cam = get_parent().get_node("Player/CameraRig/Camera")
	
	if event is InputEventMouseMotion:
		ray_origin = cam.project_ray_origin(get_viewport().get_mouse_position())
		ray_target = cam.project_ray_normal(get_viewport().get_mouse_position())*1000
 
# Under "func _physics_process(delta):"
	
	var space_state = get_world().direct_space_state
	var ray = space_state.intersect_ray(ray_origin, ray_target,[self],1,true,true)
	
	if ray:
		var ray_collision_point = ray.position
		var object_position = get_translation()
		ray_collision_point = object_position-ray_collision_point
		var angle = Vector2(ray_collision_point.x,ray_collision_point.z).angle_to(Vector2(object_position.x,object_position.z))
		self.set_rotation(Vector3(0,angle,0))
	
