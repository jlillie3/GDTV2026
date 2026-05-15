extends Node

# For custom global data
# add_if_unsupported will add a specific key to your global data if the key you pass in wasn't found

var GlobalData = { "can_double_jump" : false }

func _ready() -> void:
	randomize() # Remove this if you don't want it to be randomized
	if Engine.is_editor_hint():
		set_process(false)

func supports(key):
	if GlobalData.has(key):
		return GlobalData[key]
	
	return false

func add_if_unsupported(key, default_value : bool = false):
	if not GlobalData.has(key):
		GlobalData.add(key, default_value)

# Uncomment if you add a ui_exit input to your input map that you want to use to go back to the previous scene
# for testing purposes. Make sure to comment this out before publishing your game! (Or remove ui_exit from the map.)
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_exit"):
		SceneChanger.close_scene()

#region Generally Useful Stuff
func is_tween_running(tween: Tween) -> bool:
	return tween != null and tween.is_valid() and tween.is_running()

func safe_kill_tween(tween: Tween) -> void:
	if is_tween_running(tween):
		tween.kill()

func tween_bounce(node: Node2D, bounce_height: float = 2.0, duration: float = 0.1) -> Tween:
	node.position.y = 0.0
	node.scale = Vector2.ONE
	var tween = node.create_tween()
	tween.set_loops()
	tween.tween_property(node, "position:y", -bounce_height, duration * 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(node, "position:y", 0.0, duration * 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	return tween

func tween_move(node: Node2D, distance: float, direction: Vector2, move_duration: float = 0.4, squash_scale: Vector2 = Vector2(0.9, 1.1)) -> void:
	var target = node.position + direction.normalized() * distance
	var tween = node.create_tween()
	tween.set_parallel()
	tween.tween_property(node, "position", target, move_duration).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(node, "scale", squash_scale, move_duration * 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(node, "scale", Vector2.ONE, move_duration * 0.75).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	await tween.finished
	
func spawn_on_main(scene: PackedScene, pos, rot):
	var inst = scene.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.global_position = pos
	inst.global_rotation = rot
	
	return inst
#endregion Generally Useful Stuff

#region 3D Stuff
# Aligns a given transform with the angle of new_y
func align_with_y(xform: Transform3D, new_y: Vector3) -> Transform3D:
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	xform.basis = xform.basis.orthonormalized()
	return xform

#endregion
