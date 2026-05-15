extends CanvasLayer

var _label : Label
var _tracked_values: Dictionary = {}

func _ready() -> void:
	# Create label programmatically if it doesn't exist
	if not has_node("Label"):
		_label = Label.new()
		_label.name = "Label"
		add_child(_label)
		_label.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT, Control.PRESET_MODE_MINSIZE, 10)
		_label.add_theme_color_override("font_shadow_color", Color.BLACK)
	else:
		_label = get_node("Label")
	
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS # Ensure it works even when paused

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("toggle_debug"):
		visible = !visible
	
	if visible:
		var text = "FPS: %d\n" % Engine.get_frames_per_second()
		text += "Static Memory: %.2f MB\n" % (OS.get_static_memory_usage() / 1048576.0)
		
		for key in _tracked_values:
			text += "%s: %s\n" % [key, str(_tracked_values[key])]
		
		_label.text = text

func track_value(key: String, value: Variant) -> void:
	_tracked_values[key] = value
