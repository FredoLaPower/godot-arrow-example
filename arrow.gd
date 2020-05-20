extends RigidBody2D

func _physics_process(delta):
	$Wrapper.rotation = Vector2.RIGHT.angle_to(linear_velocity)
	update()

func shoot(origin, force):
	position = origin
	
	apply_impulse(Vector2(-67.5,0), force)


func _draw():
	draw_line(Vector2.ZERO, linear_velocity, Color(255, 0, 0, 255), 1)
