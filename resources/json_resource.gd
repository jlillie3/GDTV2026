@tool
class_name JsonResource
extends Resource

var data: Dictionary = {}
var props = null

func _init(json: Dictionary = {}, keys: Array[String] = [], require_all_keys: bool = true) -> void:
	if json.is_empty():
		return

	if keys.is_empty():
		breakpoint
		return

	for key in keys:
		if json.has(key):
			data[key] = json[key]
		elif require_all_keys:
			breakpoint

func _get(prop: StringName) -> Variant:
	var key = String(prop)
	if data.has(key):
		return data[key]

	breakpoint
	return null

func _set(prop: StringName, value: Variant) -> bool:
	data[String(prop)] = value
	return true

func _get_property_list() -> Array[Dictionary]:
	if not props:
		props = []
		for key in data.keys():
			props.append({
				"name": String(key),
				"type": typeof(data[key]),
				"usage": PROPERTY_USAGE_DEFAULT,
			})

	return props




## Example
#class_name ShipData
#extends JsonResource


#const KEYS = [
#	"Name",
#	"FlavorText",
#	"Owner",
#]

#func _init(json: Dictionary = {}) -> void:
#	super._init(json, KEYS)
