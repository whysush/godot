extends Area2D

# Add keys to input maps
# Remember order Area2D > Sprite > CollisionShape2D > RayCast2D > Tween > AnimationPlayer
var tile_size = 64
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	position += inputs[dir] * tile_size

