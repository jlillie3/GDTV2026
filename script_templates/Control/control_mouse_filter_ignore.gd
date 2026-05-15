# meta-name: Control (Ignore Mouse)
# meta-description: Control with mouse_filter set to IGNORE
extends _BASE_


func _ready() -> void:
	mouse_filter = MouseFilter.MOUSE_FILTER_IGNORE
