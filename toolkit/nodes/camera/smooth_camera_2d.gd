extends Camera2D
class_name SmoothCamera2D

@export var target_node : Node2D
@export var smooth_speed : float = 5.0
@export var use_pixel_snap : bool = true

func _process(delta: float) -> void:
	if target_node:
		var target_pos = target_node.global_position
		global_position = global_position.lerp(target_pos, smooth_speed * delta)
		
		if use_pixel_snap:
			global_position = global_position.round()
