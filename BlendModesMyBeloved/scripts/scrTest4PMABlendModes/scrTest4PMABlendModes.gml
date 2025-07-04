
/// @desc Drawing to application_surface
function BlendTest4() : BlendTestClass() constructor {
	title = "Surface with PMA blendmode (BEST)";
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		// Crate surface
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		
		// Draw sprite to surface
		surface_set_target(surface);
			draw_clear_alpha(c_black, 0);
			
			/*
				How this fixes the problem:
				"bm_src_alpha, bm_inv_src_alpha" is equivalent to "bm_normal". We are using "bm_one" in the source alpha, so that the alpha is preserved, thus avoiding it looking that weird.
			
				When drawing the surface, we preserve the source colors and opacity of the alpha channel, and multiply it by the inverse of the bottom opacity (destination).
			*/
			gpu_push_state();
			subTitle = "";
			if (_toggleFixIndex > 0) {gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha); subTitle = "blendmode inside";};
				draw_sprite(sprPlanet, 0, 100, 100);
				draw_text_test(100, 100, "Hello World!");
				draw_sprite(sprPlanet, 0, mouse_x-_xx, mouse_y-_yy);
			gpu_pop_state();
			
		surface_reset_target();
		
		
		// Draw surface
		gpu_push_state();
		if (_toggleFixIndex > 1) {gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); subTitle = "blendmode inside + outside";}
		draw_surface(surface, _xx, _yy);
		gpu_pop_state();
	}
}
