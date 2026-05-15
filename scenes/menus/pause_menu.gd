extends CanvasLayer

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and event.is_pressed():
		# Prevent pausing if we are in main menu or splash
		var current_scene = get_tree().current_scene.scene_file_path
		if "main_menu" in current_scene or "splash" in current_scene:
			return
		toggle_pause()

func toggle_pause() -> void:
	var paused = !get_tree().paused
	get_tree().paused = paused
	visible = paused
	
	if visible:
		$Control/VBoxContainer/ResumeButton.grab_focus()

func _on_resume_button_pressed() -> void:
	toggle_pause()

func _on_settings_button_pressed() -> void:
	SceneChanger.change_scene_to("res://scenes/menus/settings.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	SceneChanger.change_scene_to("res://scenes/menus/main_menu.tscn")
