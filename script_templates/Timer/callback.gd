# meta-name: Timer Callback
# meta-description: Timer with timeout signal pre-connected
extends _BASE_


func _ready() -> void:
	timeout.connect(_on_timeout)


func _on_timeout() -> void:
	pass
