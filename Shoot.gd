extends Node2D

var Arrow: PackedScene = preload("res://Arrow.tscn")

var _origin: Vector2 = Vector2.ZERO
var _force_vector: Vector2 = Vector2.ZERO

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		_origin = get_global_mouse_position()
	if Input.is_action_pressed("shoot"):
		_force_vector = get_local_mouse_position()
	elif Input.is_action_just_released("shoot"):
		_shoot_arrow()
		
		_force_vector = Vector2.ZERO
	else:
		position = get_global_mouse_position()
	
	update() # redraw force vector
	
	owner.get_node("Label").text = "Rotation: %s rad | Magnitude: %s" % [Vector2.RIGHT.angle_to(_force_vector), _force_vector.length()]

func _draw():
	if _force_vector != Vector2.ZERO:
		var rot = Vector2.RIGHT.angle_to(_force_vector)
		var col = Color(255, 0, 0 ,255)
		
		draw_line(Vector2.ZERO, _force_vector, col)
		draw_line(_force_vector, _force_vector + Vector2(-10,5).rotated(rot), col)
		draw_line(_force_vector, _force_vector + Vector2(-10,-5).rotated(rot), col)


func _shoot_arrow() -> void:
	var arrow = Arrow.instance()
	arrow.shoot(_origin, _force_vector)
	owner.add_child(arrow)
