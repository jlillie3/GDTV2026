extends Node2D
class_name Effect

# Base class for any sort of special effect; inherit this and add your special code under the overridden start_effect function
# The parent_node is the parent of the effect, in case you need access to that.
# See how the special effects like squash and stretch function in the /effects folder.

signal effect_completed

@export var autostart : bool = true
@export var one_shot : bool = true

func _ready() -> void:
	if one_shot:
		effect_completed.connect(queue_free)
	if autostart:
		var parent = get_parent()
		if parent:
			start_effect(parent)

func start_effect(_parent_node) -> void:
	pass
