// if paused or not at the hidden position
if (global.paused or abs((x - (room_width - 1393) / 2) / 20) > 0.1 or abs((y - (room_height + 1289) / 2) / 20) > 0.1) {
	draw_self()
	
	draw_set_colour(c_white)
	draw_roundrect_ext((room_width / 2) - 450, (y + (689 / 2)) + 50, (room_width / 2) + 50, (y + (689 / 2)) + 250, 50, 50, false)
	draw_set_colour(c_black)
	center_text()
	draw_text_transformed((room_width / 2) - 200, (y + (689 / 2)) + 150, "i give up bro", 2, 2, 0)
	if (point_in_rectangle(mouse_x, mouse_y, (room_width / 2) - 450, (y + (689 / 2)) + 50, (room_width / 2) + 50, (y + (689 / 2)) + 250) and mouse_check_button_pressed(mb_left)) {
		game_end()
	}
}

reset_draw()