class_name EnemyAttackState
extends State

var simulated_attack_delay_timer := 0.5
var current_time := 0.0

func _enter_state() -> void:
	pass
	#will not be in run method, just don't currently have a windup animation
	#if anim.has_animation("Attack"):
		#anim.play("Attack")
		#anim.animation_finished.connect(func(): finished.emit(), CONNECT_ONE_SHOT)
	#else:
		#push_error(actor.name + " does not have an Attack animation on their animation player!!!")

func _run(_delta) -> void:
	current_time += _delta
	if current_time >= simulated_attack_delay_timer:
		if anim.current_animation == "Attack":
			return
		if anim.has_animation("Attack"):
			anim.play("Attack")
			anim.animation_finished.connect(func(_animation): finished.emit(), CONNECT_ONE_SHOT)
		else:
			push_error(actor.name + " does not have an Attack animation on their animation player!!!")
			finished.emit()

func _exit_state() -> void:
	#need to make sure the hitbox doesn't persist if we switch states in the middle of the attack animation
	actor.clear_hitbox_polygon()
	
