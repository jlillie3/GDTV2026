shader_type canvas_item;

uniform float dissolve_value : hint_range(0.0, 1.0) = 0.0;
uniform sampler2D dissolve_texture;

void fragment() {
	vec4 main_texture = texture(TEXTURE, UV);
	float noise_texture = texture(dissolve_texture, UV).r;
	
	if (noise_texture < dissolve_value) {
		discard;
	}
	
	COLOR = main_texture;
}
