extends KinematicBody2D

var movespeed = 500
var bullet_speed = 2000
var bullet = preload("res://Bullet.tscn")


func _ready():
	pass 
# warning-ignore:unused_argument
# set input maps in project settings for this to work
func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x +=1
	if Input.is_action_pressed("left"):
		motion.x -=1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())
