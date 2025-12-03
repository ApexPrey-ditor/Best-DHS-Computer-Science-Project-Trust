reset_draw()

draw_set_color(c_black)
draw_text(10, 10, alarmList)

/*if (global.paused) {
	// draw_rectangle(150, 150, room_width - 150, room_height - 150, false)
	draw_set_color(c_grey)
	draw_set_alpha(0.75)
	draw_roundrect_ext(150, 150, room_width - 150, room_height - 150, 50, 50, false)
	draw_set_color(c_black)
	center_text()
	draw_set_alpha(1)
	draw_set_font(archive)
	draw_text_transformed(room_width / 2, 300, "Paused", 15, 15, 0)
	draw_text_transformed(room_width / 2, 500, "za wooooorrrrrllldddddoooooooo", 2, 2, 0)
}*/