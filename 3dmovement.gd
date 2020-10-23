extends KinematicBody

export var speed: float = 10

func _physics_process(_delta: float) -> void:
    var wishdir = Vector3()

    if Input.is_key_pressed(KEY_A):
        wishdir += Vector3.LEFT
    if Input.is_key_pressed(KEY_D):
        wishdir += Vector3.RIGHT
    if Input.is_key_pressed(KEY_W):
        wishdir += Vector3.FORWARD
    if Input.is_key_pressed(KEY_S):
        wishdir += Vector3.BACK

    wishdir = wishdir.normalized()
    move_and_slide(wishdir * speed)
