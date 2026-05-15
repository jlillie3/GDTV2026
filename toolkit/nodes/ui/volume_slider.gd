extends HSlider

@export var bus_name : String

@onready var test_audio_stream = $AudioStreamPlayer

var bus_index : int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)	
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func _process(delta: float) -> void:
	if has_focus():
		var direction = Input.get_axis("ui_left","ui_right")
		value += direction * delta
	
func _on_value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(new_value))

func _on_drag_started() -> void:
	if test_audio_stream == null: return
	test_audio_stream.play()

func _on_drag_ended(_value_changed: bool) -> void:
	if test_audio_stream == null: return
	test_audio_stream.stop()
