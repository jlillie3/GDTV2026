# meta-name: Control (Pass-through)
# meta-description: Control with mouse_filter set to PASS (receives events but passes to children)
extends _BASE_


func _ready() -> void:
	mouse_filter = MouseFilter.MOUSE_FILTER_PASS
