
varying vec2 v_vTexcoord;
varying vec4 v_vColour; // vertex color

uniform float u_alpha;

void main() {
	gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour * u_alpha; // RGBA * alpha
}
