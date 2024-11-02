
// close test
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

// save surfaces
if (keyboard_check_pressed(vk_enter)) {
	var i = 0, isize = array_length(testList), _item = undefined;
	repeat(isize) {
		_item = testList[i];
		if (variable_struct_exists(_item, "surface")) {
			if (surface_exists(_item.surface)) surface_save(_item.surface, $"surface{i}.png");
		}
		++i;
	}
}

// test
if (toggleFixTimerEnabled) {
	if (toggleFixTimer-- <= 0) {
		toggleFixTimer = toggleFixTimerBase;
		toggleFixIndex += 1;
		if (toggleFixIndex > toggleFixIndexMax) {
			toggleFixIndex = 0;
		}
	}
}

layer_background_visible(layer_background_get_id("Background"), enableBackground);
layer_background_blend(layer_background_get_id("Void"), make_color_rgb(31, 31, 31));
if (enableBlackBuffer) layer_background_blend(layer_background_get_id("Void"), c_black);
