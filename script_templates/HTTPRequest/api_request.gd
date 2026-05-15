# meta-name: API Request
# meta-description: HTTPRequest with JSON response parsing
extends _BASE_


func _ready() -> void:
	request_completed.connect(_on_request_completed)


func perform_request(url: String) -> void:
	request(url)


func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	if json:
		_handle_response(json)


func _handle_response(data: Variant) -> void:
	pass
