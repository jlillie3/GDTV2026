# meta-name: Physics Prop
# meta-description: RigidBody2D with common physics prop settings
extends _BASE_

@export var max_speed : float = 500.0
@export var bounce_factor : float = 0.5


func _ready() -> void:
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = bounce_factor


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
