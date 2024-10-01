shader_type canvas_item;

uniform bool is_hurt;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    if (is_hurt) {
        color.rgb = mix(color.rgb, vec3(1, 1, 1), 1);
    }	
    COLOR = color;
}
