
/// @desc Drawing to application_surface
function BlendTest1() : BlendTestClass() constructor {
	title = "[DEFAULT] Draw to application_surface";
	
	surface = -1;
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		surface = application_surface;
		
		// =============================================================
		
		// draw
		// here we are drawing directly on the application_surface, without using any additional surface
		// The default blendmode is "bm_normal", which is equivalent to bm_src_alpha, bm_inv_src_alpha, so sprites with opacity are blended correctly.
		draw_sprite(sprPlanet, 0, _xx+100, _yy+100);
		__draw_text_test(_xx+100, _yy+100, "Hello World!");
		
		
		// =============================================================
		// draw title
		__draw_text_shadow(_xx, _yy, title, _ww);
	}
}
