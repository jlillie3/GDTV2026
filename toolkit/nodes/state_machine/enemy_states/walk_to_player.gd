class_name EnemyWalkToPlayerState
extends State

var player

func _enter_state() -> void:
	if not player:
		player = get_tree().get_first_node_in_group("Player") as Player
	
func _run(_delta) -> void:
	var distance_remaining = actor.global_position.distance_to(player.global_position)
	if distance_remaining > 30.0:
		actor.nav_agent.target_position = player.global_position
		var current_agent_position = actor.global_position
		var next_path_position = actor.nav_agent.get_next_path_position()
		
		var new_velocity = current_agent_position.direction_to(next_path_position) * actor.move_speed
		
		actor.on_navigation_agent_2d_velocity_computed(new_velocity)
		actor.move()
	else:
		finished.emit()
	
func _exit_state() -> void:
	pass
