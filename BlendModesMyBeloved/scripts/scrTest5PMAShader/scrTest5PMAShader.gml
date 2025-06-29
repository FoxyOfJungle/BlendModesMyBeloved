
/// @desc Drawing to application_surface
function BlendTest5() : BlendTestClass() constructor {
	title = "Surface with PMA shader";
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		// Crate surface
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		
		// Draw sprite to surface
		surface_set_target(surface);
			draw_clear_alpha(c_black, 0);
			
			gpu_push_state();
			subTitle = "";
			if (_toggleFixIndex > 0) {gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); subTitle = "blendmode inside";}
			if (_toggleFixIndex > 1) {shader_set(__bf_shPremultiplyAlpha); subTitle = "blendmode inside + shader";}
				draw_sprite(sprPlanet, 0, 100, 100);
				draw_text_test(100, 100, "Hello World!");
			shader_reset();
			gpu_pop_state();
			
		surface_reset_target();
		
		
		// Draw surface
		gpu_push_state();
		if (_toggleFixIndex > 2) {gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); subTitle = "blendmode (inside+outside) + shader";}
		draw_surface(surface, _xx, _yy);
		gpu_pop_state();
	}
}
