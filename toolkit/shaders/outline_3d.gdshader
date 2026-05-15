shader_type spatial;

render_mode blend_mix, cull_front, unshaded;

uniform vec4 color: source_color = vec4(1, 0, 0, 1);
uniform float size: hint_range(1.0, 1.5, 0.01) = 1.05;
uniform bool on = true;

void vertex() {
	if (on) {
		VERTEX *= size;
	}
}

void fragment() {
	if (on) {
		ALBEDO = color.rgb;
		ALPHA = color.a;
	}
}