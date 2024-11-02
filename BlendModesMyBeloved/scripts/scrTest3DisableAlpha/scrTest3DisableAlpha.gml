
/// @desc Drawing to application_surface
function BlendTest3() : BlendTestClass() constructor {
	title = "Surface with RGB write (disable alpha write)";
	
	surface = -1;
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		var _subTitle = "";
		
		// =============================================================
		// crate surface
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		
		// draw sprite to surface
		surface_set_target(surface);
			// we are writing pixels only in the RGB channel, leaving the alpha intact. blendmode is still "normal" here (bm_src_alpha, bm_inv_src_alpha)
			draw_clear_alpha(c_black, 1); // this is the same as draw_clear(c_black)
			
			if (_toggleFixIndex > 0) {gpu_set_colorwriteenable(true, true, true, false); _subTitle = "Alpha write off";}
			draw_sprite(sprPlanet, 0, 100, 100);
			__draw_text_test(100, 100, "Hello World!");
			gpu_set_colorwriteenable(true, true, true, true);
			
		surface_reset_target();
		
		
		// draw surface
		draw_surface(surface, _xx, _yy);
		
		
		// =============================================================
		// draw title
		__draw_text_shadow(_xx, _yy, title + " | " + _subTitle, _ww);
	}
}
