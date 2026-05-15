extends TextureButton
class_name AutoClickMaskButton
## Auto-generates a click mask from the texture's alpha channel on ready.

@export var threshold: float = 0.5:
	set(value):
		threshold = value
		if is_inside_tree():
			update_click_mask()

func _ready() -> void:
	if texture_normal:
		update_click_mask()

func update_click_mask() -> void:
	if not texture_normal:
		return
	
	var image: Image = texture_normal.get_image()
	if not image:
		return
	
	var bitmap: BitMap = BitMap.new()
	bitmap.create_from_image_alpha(image, threshold)
	texture_click_mask = bitmap
	print("BitmapButton: Click mask updated with threshold ", threshold)

func _set(property: StringName, value: Variant) -> bool:
	if property == "texture_normal":
		texture_normal = value
		update_click_mask()
		return true
	return false
