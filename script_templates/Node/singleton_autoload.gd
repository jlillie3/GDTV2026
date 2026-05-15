# meta-name: Singleton Autoload
# meta-description: Pattern for autoloaded singleton scripts
extends Node


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
