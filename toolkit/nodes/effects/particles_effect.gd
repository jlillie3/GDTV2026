extends Effect

var _particles = CPUParticles2D.new()

func start_effect(_parent_node) -> void:
	add_child(_particles)
	_particles.one_shot = one_shot
	_particles.emitting = true
	if one_shot:
		_particles.finished.connect(effect_completed.emit)
