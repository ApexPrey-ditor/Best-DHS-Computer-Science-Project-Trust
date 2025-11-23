if (type >= 28) {
	center_text()
		draw_set_font(archive)
		draw_healthbar(64, 8, room_width - 448, 40, (hp / cash) * 100, c_white, c_red, c_green, 0, true, true)
		draw_set_colour(c_black)
		draw_text_transformed((room_width - 384) / 2, 24, name + " " + string(ceil(hp)) + "/" + string(cash), 2, 2, 0)
}
else {
	if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		center_text()
		draw_set_font(archive)
		draw_healthbar(x - ceil(string_length(name + " " + string(hp) + "/" + string(cash)) * 32/6), y - 72, ceil(x + string_length(name + " " + string(hp) + "/" + string(cash)) * 32/6), y - 56, (hp / cash) * 100, c_white, c_red, c_green, 0, true, true)
		draw_set_colour(c_black)
		draw_text(x, y - 64, name + " " + string(hp) + "/" + string(cash))
	}
}