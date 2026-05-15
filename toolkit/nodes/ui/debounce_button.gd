class_name DebounceButton
extends Button

signal d_pressed()

@export var debounce_timeout: float
@export var should_disable: bool

func _ready() -> void:
	pressed.connect(_on_button_pressed, CONNECT_ONE_SHOT)
 
func _on_button_pressed() -> void:
	if should_disable:
		disabled = true
	d_pressed.emit()
	await get_tree().create_timer(debounce_timeout).timeout
	pressed.connect(_on_button_pressed, CONNECT_ONE_SHOT)
	if should_disable:
		disabled = false
