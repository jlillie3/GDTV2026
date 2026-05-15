class_name Utils
extends Object

const DEBUG_CIRCLE_SCENE = preload("res://toolkit/nodes/debug/debug_circle.tscn")

static func decide(probability: float) -> bool:
	return randf() < probability

static func rand_point_in_circle(radius: float) -> Vector2:
	var angle = randf() * TAU
	var dist = sqrt(randf()) * radius
	return Vector2(cos(angle), sin(angle)) * dist

static func shuffle_new(array: Array) -> Array:
	var new_array = array.duplicate()
	new_array.shuffle()
	return new_array

static func draw_debug_circle(parent: Node, pos: Vector2, radius: float, color: Color, time: float = 1.0) -> void:
	if not is_instance_valid(parent):
		return
		
	var debug_node = DEBUG_CIRCLE_SCENE.instantiate()
	debug_node.global_position = pos
	debug_node.radius = radius
	debug_node.color = color
	debug_node.time = time
	
	parent.add_child(debug_node)
