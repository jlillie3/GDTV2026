class_name UIAnimator
extends Object

static func move_control(ctrl: Control, pos: Vector2, time: float, ease: Tween.EaseType = Tween.EASE_IN_OUT, trans: Tween.TransitionType = Tween.TRANS_LINEAR) -> Tween:
	var tween = ctrl.create_tween()
	tween.set_trans(trans)
	tween.set_ease(ease)
	tween.tween_property(ctrl, "global_position", pos, time)
	
	return tween

static func scale_control(ctrl: Control, amount: Vector2, time: float, ease: Tween.EaseType = Tween.EASE_IN_OUT, trans: Tween.TransitionType = Tween.TRANS_LINEAR) -> Tween:
	var tween = ctrl.create_tween()
	tween.set_trans(trans)
	tween.set_ease(ease)
	tween.tween_property(ctrl, "scale", amount, time)
	
	return tween

static func rotate_control(ctrl: Control, rot: float, time: float, ease: Tween.EaseType = Tween.EASE_IN_OUT, trans: Tween.TransitionType = Tween.TRANS_LINEAR) -> Tween:
	var tween = ctrl.create_tween()
	tween.set_trans(trans)
	tween.set_ease(ease)
	tween.tween_property(ctrl, "rotation", rot, time)
	
	return tween

static func fade_in(ctrl: Control, time: float = 0.3, delay: float = 0.0) -> Tween:
	ctrl.visible = true
	ctrl.modulate.a = 0.0
	var tween = ctrl.create_tween()
	tween.tween_property(ctrl, "modulate:a", 1.0, time).set_delay(delay).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	return tween

static func fade_out(ctrl: Control, time: float = 0.3, delay: float = 0.0) -> Tween:
	var tween = ctrl.create_tween()
	tween.tween_property(ctrl, "modulate:a", 0.0, time).set_delay(delay).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(ctrl.hide)
	return tween

static func pulse(ctrl: Control, scale_amount: Vector2 = Vector2(1.1, 1.1), time: float = 0.5) -> Tween:
	var original_scale = ctrl.scale
	var tween = ctrl.create_tween()
	tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(ctrl, "scale", original_scale * scale_amount, time * 0.5)
	tween.tween_property(ctrl, "scale", original_scale, time * 0.5)
	return tween

static func shake(ctrl: Control, strength: float = 10.0, time: float = 0.4) -> Tween:
	var original_pos = ctrl.position
	var tween = ctrl.create_tween()
	var steps = 10
	var step_time = time / float(steps)
	for i in range(steps):
		var offset = Vector2(randf_range(-strength, strength), randf_range(-strength, strength))
		tween.tween_property(ctrl, "position", original_pos + offset, step_time)
	tween.tween_property(ctrl, "position", original_pos, step_time)
	return tween

static func slide_in(ctrl: Control, from_offset: Vector2, time: float = 0.4, delay: float = 0.0) -> Tween:
	var target_pos = ctrl.position
	ctrl.position += from_offset
	var tween = ctrl.create_tween()
	if delay > 0:
		ctrl.visible = false
		tween.tween_interval(delay)
		tween.tween_callback(func(): ctrl.visible = true)
	
	tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(ctrl, "position", target_pos, time)
	return tween

static func pop_in(ctrl: Control, time: float = 0.3, delay: float = 0.0) -> Tween:
	ctrl.scale = Vector2.ZERO
	ctrl.visible = true
	var tween = ctrl.create_tween()
	if delay > 0:
		ctrl.visible = false
		tween.tween_interval(delay)
		tween.tween_callback(func(): ctrl.visible = true)
	
	tween.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(ctrl, "scale", Vector2.ONE, time)
	return tween

static func visual_flash(ctrl: Control, color: Color = Color.WHITE, time: float = 0.2) -> Tween:
	var original_modulate = ctrl.modulate
	var tween = ctrl.create_tween()
	ctrl.modulate = color
	tween.tween_property(ctrl, "modulate", original_modulate, time).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	return tween

