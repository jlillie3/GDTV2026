class_name EnemyIdleState
extends State

func _enter_state() -> void:
	if anim.has_animation("Idle"):
		anim.play("Idle")
	else:
		push_error(actor.name + " does not have an Idle animation on their animation player!!!")
