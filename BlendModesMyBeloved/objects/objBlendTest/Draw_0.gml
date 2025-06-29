
// drawing to application_surface target
draw_set_color(c_white);
gpu_set_blendmode(bm_max);
draw_text(40, 40, $"BlendModes Test by Mozart Junior (@foxyofjungle)  |  The \"animation\" shows the progress of fixing the problem.\nThe white rectangles are just to indicate the test drawing area.\nPMA = Premultiply Alpha. | TestMode: {toggleFixIndex}");

gpu_set_blendmode(bm_normal);

var i = 0, isize = array_length(testList), _item = undefined;

var _color = c_white;
var _areaX = 40;
var _areaY = 120;
var _areaW = room_width-_areaX;
var _spacingW = 380;
var _spacingH = 250;
var _xx = _areaX;
var _yy = _areaY;

repeat(isize) {
	_item = testList[i];
	_item.Draw(_xx, _yy, _spacingW, _spacingH, toggleFixIndex);
	
	// draw title
	draw_text_shadow(_xx, _yy, _item.title + " | " + _item.subTitle, _spacingW);
		
	// draw area rectangle
	draw_rectangle_color(_xx, _yy, _xx+_spacingW, _yy+_spacingH, _color, _color, _color, _color, true);
	
	_xx += _spacingW + 32;
	if (_xx > _areaW) {
		_xx = _areaX;
		_yy += _spacingH + 32;
	}
	++i;
}
