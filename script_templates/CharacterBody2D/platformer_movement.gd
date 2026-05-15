# meta-name: Platformer Movement
# meta-description: CharacterBody2D with 2D platformer movement boilerplate
extends CharacterBody2D

@export var speed : float = 300.0
@export var jump_velocity : float = -400.0
@export var gravity_multiplier : float = 1.0

var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * gravity_multiplier * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
