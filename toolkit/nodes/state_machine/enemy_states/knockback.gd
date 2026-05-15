class_name EnemyKnockbackState
extends State

@export var knockback_time := 0.12

var player: Player
var current_time := 0.0

func _enter_state() -> void:
	actor.provoked = true
	if not player:
		player = get_tree().get_first_node_in_group("Player")
	actor.play_effect("Flash")
	if anim.has_animation("Knockback"):
		anim.play("Knockback")
	else:
		push_error(actor.name + " does not have an Knockback animation on their animation player!!!")
	actor.velocity = -actor.global_position.direction_to(player.global_position) * 150.0
	
func _run(_delta) -> void:
	actor.move()
	current_time += _delta
	if current_time >= knockback_time:
		finished.emit()
	
func _exit_state() -> void:
	current_time = 0.0
