class_name DebugCircle
extends Node2D

var radius: float = 10.0
var color: Color = Color.RED
var time: float = 1.0

func _ready() -> void:
	queue_redraw()
	var tween = create_tween()
	tween.tween_interval(time)
	tween.tween_callback(queue_free)

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)
