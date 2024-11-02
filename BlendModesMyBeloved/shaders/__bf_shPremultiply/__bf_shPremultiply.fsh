
varying vec2 v_vTexcoord;
varying vec4 v_vColour; // vertex color

void main() {
	vec4 col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
	gl_FragColor = vec4(col.rgb*col.a, col.a);
}
