
/// @desc Drawing to application_surface
function BlendTest3() : BlendTestClass() constructor {
	title = "Surface with RGB write (disable alpha write)";
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		// Crate surface
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		
		// Draw sprite to surface
		surface_set_target(surface);
			draw_clear_alpha(c_black, 1); // this is the same as draw_clear(c_black)
			
			subTitle = "";
			if (_toggleFixIndex > 0) {gpu_set_colorwriteenable(true, true, true, false); subTitle = "Alpha write off";} // we are writing pixels only in the RGB channel, leaving the alpha intact. blendmode is still "normal" here (bm_src_alpha, bm_inv_src_alpha)
			draw_sprite(sprPlanet, 0, 100, 100);
			draw_text_test(100, 100, "Hello World!");
			gpu_set_colorwriteenable(true, true, true, true);
			
		surface_reset_target();
		
		
		// Draw surface
		draw_surface(surface, _xx, _yy);
	}
}
