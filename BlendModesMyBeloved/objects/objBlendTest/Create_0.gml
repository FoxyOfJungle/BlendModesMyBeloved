
// Create an array with test cases
testList = [
	new BlendTest1(),
	new BlendTest2(),
	new BlendTest3(),
	new BlendTest4(),
	new BlendTest5(),
	new BlendTest6(),
];
toggleFixIndex = 0;
toggleFixIndexMax = 3;
toggleFixTimerBase = 30;
toggleFixTimer = toggleFixTimerBase;
toggleFixTimerEnabled = true;
enableBackground = true;
enableBlackBuffer = false;

// Debug UI
dbg_view("DEBUG", true, room_width-400, room_height-160, 400, 160);
dbg_slider(ref_create(self, "toggleFixIndex"), 0, toggleFixIndexMax, "Test Index", 1);
dbg_checkbox(ref_create(self, "toggleFixTimerEnabled"), "Automatic Test");
dbg_checkbox(ref_create(self, "enableBackground"), "Enable Background");
dbg_checkbox(ref_create(self, "enableBlackBuffer"), "Enable Black Backbuffer");
