
/// @desc Drawing to application_surface
function BlendTest6() : BlendTestClass() constructor {
	title = "Surface inside surface";
	
	surface = -1;
	surface2 = -1;
	
	static Draw = function(_xx, _yy, _ww, _hh, _toggleFixIndex) {
		// Create surfaces
		if (!surface_exists(surface)) {
			surface = surface_create(250, 200);
		}
		if (!surface_exists(surface2)) {
			surface2 = surface_create(120, 120);
		}
		
		
		// Draw to first surface
		surface_set_target(surface2);
			draw_clear_alpha(c_black, 0);
			gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
			draw_sprite_stretched(sprBackground, 0, 0, 0, 80, 80);
			draw_sprite(sprPlanet, 0, 100, 100);
		surface_reset_target();
		
		
		// Draw surface to surface2
		surface_set_target(surface);
			draw_clear_alpha(c_black, 0);
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); // ALWAYS USE THIS WHEN DRAWING THE SURFACE INSIDE SURFACE
			draw_surface(surface2, 0, 0);
			
			gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_one, bm_inv_src_alpha);
			draw_text_test(100, 100, "Hello World!");
		surface_reset_target();
		
		
		// Draw second surface
		gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); // application_surface is a surface too! we are still drawing A SURFACE INSIDE SURFACE
		draw_surface(surface, _xx, _yy);
		
		// =============================================================
		// IF WANT TO FADE (WITH ALPHA) THE SURFACE, YOU WILL NEED A SHADER
		// Draw second surface
		//gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
		//shader_set(__bf_shAlpha);
		//shader_set_uniform_f(shader_get_uniform(__bf_shAlpha, "u_alpha"), mouse_x/room_width);
		//draw_surface(surface, _xx, _yy);
		//shader_reset();
		
		gpu_set_blendmode(bm_normal);
	}
}
