class_name ToSceneButton
extends Button

@export_file("*.tscn") var target_scene : String
@export var target_scene_to_stack : bool = false
@export var start_focused : bool = false

func _ready():
	pressed.connect(_on_pressed)
	if start_focused:
		grab_focus()

func _on_pressed():
	assert(target_scene != "", "ERROR: No target scene set on " + name)
	if get_tree().paused:
		get_tree().paused = false
	if not target_scene_to_stack:
		SceneChanger.change_scene_to(target_scene)
	else:
		SceneChanger.change_scene_to(target_scene, SceneStack.StackOptions.push)
