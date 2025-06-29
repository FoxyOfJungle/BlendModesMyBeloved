
function draw_text_shadow(_x, _y, _str, _width, _shadowColor=c_black, _shadowAlpha=1, _shadowDistX=1, _shadowDistY=1) {
	var _old_col = draw_get_color();
	var _old_alpha = draw_get_alpha();
	draw_set_color(_shadowColor);
	draw_set_alpha(_shadowAlpha);
	draw_text_ext(_x+_shadowDistX, _y+_shadowDistY, _str, -1, _width);
	draw_set_color(_old_col);
	draw_set_alpha(_old_alpha);
	draw_text_ext(_x, _y, _str, -1, _width);
}

function draw_text_test(_x, _y, _str) {
	var _t = current_time*0.0005;
	draw_text(_x+50*cos(_t), _y+50*sin(_t), _str);
}

/// @ignore
function BlendTestClass() constructor {
	title = "N/A";
	subTitle = "";
	surface = -1;
	static Draw = function() {};
}
