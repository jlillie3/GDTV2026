extends ColorRect

@export_file("*.tscn") var target_scene : String

func _ready():
	Transition.turn_off_crt()	
	get_tree().root.content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED

func _input(event):
	if event is InputEventKey and event.pressed:
		change_scene()

func change_scene():
	SceneChanger.change_scene_to(target_scene, SceneStack.StackOptions.none)

func _on_timer_timeout():
	change_scene()
