@tool
## Animated Label will animate to a given value whenever the value is changed
class_name AnimatedNumericLabel
extends Label

@export_category("Animation")
@export var animation_time: float
@export var animation_ease := Tween.EASE_IN_OUT
@export var animation_trans := Tween.TRANS_LINEAR

var _current_value: int:
	set(val):
		_current_value = val
		text = str(_current_value)

var _tween: Tween

@export var value: int:
	set(val):
		value = val
		if _current_value != value:
			if is_tween_running(_tween):
				_tween.kill()
			
			if animation_time <= 0.0:
				_current_value = value
			else:
				_tween = create_tween()
				_tween.tween_property(self, "_current_value", value, animation_time)


func is_tween_running(tween: Tween) -> bool:
	return tween != null and tween.is_valid() and tween.is_running()
