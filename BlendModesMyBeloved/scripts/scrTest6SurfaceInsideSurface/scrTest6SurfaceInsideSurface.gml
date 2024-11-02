
/// @desc Drawing to application_surface
function BlendTest6() : BlendTestClass() constructor {
	title = "Surface inside surface";
	
	surface = -1;
	surface2 = -1;
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		var _subTitle = "";
		
		// =============================================================
		// create surfaces
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		if (!surface_exists(surface2)) {
			surface2 = surface_create(120, 120);
		}
		
		
		// draw to first surface
		surface_set_target(surface2);
			draw_clear_alpha(c_black, 0);
			gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
			draw_sprite_stretched(sprBackground, 0, 0, 0, 80, 80);
			draw_sprite(sprPlanet, 0, 100, 100);
		surface_reset_target();
		
		
		// draw surface to surface2
		surface_set_target(surface);
			draw_clear_alpha(c_black, 0);
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); // ALWAYS USE THIS WHEN DRAWING THE SURFACE INSIDE SURFACE
			draw_surface(surface2, 0, 0);
			
			gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
			__draw_text_test(100, 100, "Hello World!");
		surface_reset_target();
		
		
		// draw second surface
		gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
		draw_surface(surface, _xx, _yy);
		
		
		gpu_set_blendmode(bm_normal);
		
		// =============================================================
		// draw title
		__draw_text_shadow(_xx, _yy, title + " | " + _subTitle, _ww);
	}
}
