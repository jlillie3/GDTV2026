extends Control
class_name ButtonGroupContainer

var _group := ButtonGroup.new()

func _ready() -> void:
	mouse_filter = MouseFilter.MOUSE_FILTER_IGNORE
	_setup_buttons.call_deferred()

func _setup_buttons() -> void:
	var parent := get_parent()
	if not parent:
		return

	for child in parent.get_children():
		if child == self:
			continue
		
		if child is BaseButton:
			child.toggle_mode = true
			child.button_group = _group
