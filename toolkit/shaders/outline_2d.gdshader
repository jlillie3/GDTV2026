shader_type canvas_item;

uniform vec4 outline_color : source_color = vec4(1.0);
uniform float width : hint_range(0.0, 10.0) = 1.0;

void fragment() {
	float size = width * (1.0 / float(textureSize(TEXTURE, 0).x));
	vec4 sprite_color = texture(TEXTURE, UV);
	float alpha = sprite_color.a;
	
	alpha += texture(TEXTURE, UV + vec2(0.0, -size)).a;
	alpha += texture(TEXTURE, UV + vec2(size, -size)).a;
	alpha += texture(TEXTURE, UV + vec2(size, 0.0)).a;
	alpha += texture(TEXTURE, UV + vec2(size, size)).a;
	alpha += texture(TEXTURE, UV + vec2(0.0, size)).a;
	alpha += texture(TEXTURE, UV + vec2(-size, size)).a;
	alpha += texture(TEXTURE, UV + vec2(-size, 0.0)).a;
	alpha += texture(TEXTURE, UV + vec2(-size, -size)).a;
	
	vec4 final_color = mix(outline_color, sprite_color, sprite_color.a);
	COLOR = vec4(final_color.rgb, clamp(alpha, 0.0, 1.0));
}
