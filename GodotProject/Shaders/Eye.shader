shader_type canvas_item;

uniform sampler2D irisTexture;
uniform vec2 irisPosition;
uniform vec4 irisColor:hint_color = vec4(1.0,1.0,1.0,1.0);

void fragment() {
	
	vec2 scleraSize = vec2(textureSize(TEXTURE,0));
	vec2 irisSize = vec2(textureSize(irisTexture,0));
	
    vec4 t1 = texture(TEXTURE, UV);
    vec2 UV2 = UV * (scleraSize / irisSize) - ((irisPosition - irisSize / 2.0 + scleraSize / 2.0) / irisSize);
    vec4 t2 = texture(irisTexture, UV2) * irisColor;
    if(UV2.x >= 0.0 && UV2.x <= 1.0 && UV2.y >= 0.0 && UV2.y <= 1.0) {
        COLOR = vec4(mix(t1.rgb, t2.rgb, t2.a), t1.a);
    } else {
        COLOR = t1;
    }
}