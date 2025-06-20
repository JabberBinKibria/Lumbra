extends Node2D

var dragable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

func _process(delta):
	if dragable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
			
		
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
			if Input.is_action_just_pressed("rotate"):
				rotation_degrees += 90
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initialPos, 0.2).set_ease(Tween.EASE_OUT)



func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate =Color(Color.ANTIQUE_WHITE, 1)
		body_ref = body 

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate =Color(Color.ALICE_BLUE, 1)

func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		dragable = true

func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		dragable = false
