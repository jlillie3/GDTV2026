class_name EnemyKOState
extends State


func _enter_state() -> void:
	if anim.has_animation("KO"):
		anim.play("KO")
	else:
		push_error(actor.name + " does not have a KO animation on their animation player!!!")
