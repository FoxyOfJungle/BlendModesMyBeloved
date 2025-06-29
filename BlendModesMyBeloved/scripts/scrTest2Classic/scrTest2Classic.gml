
/// @desc Drawing to application_surface
function BlendTest2() : BlendTestClass() constructor {
	title = "[BAD - CLASSIC WAY] Surface with draw_clear_alpha(c_black, 0) only";
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		// Crate surface
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		
		// Draw sprite to surface
		surface_set_target(surface);
			// this is the common way everyone does it (which is bad).
			// The normal blendmode (bm_src_alpha, bm_inv_src_alpha) takes the alpha channel into account, so the alpha information is multiplied in a "weird" way (This is not a bug)
			draw_clear_alpha(c_black, 0);
			draw_sprite(sprPlanet, 0, 100, 100);
			draw_text_test(100, 100, "Hello World!");
		surface_reset_target();
		
		
		// Draw surface
		draw_surface(surface, _xx, _yy);
	}
}
