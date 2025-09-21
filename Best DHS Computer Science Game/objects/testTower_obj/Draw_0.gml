// draw a grey circle that corresponds to the towers range

if placing {
	draw_set_alpha(0.5)
	if bbox_right < room_width - 384 and bbox_left > 0 and bbox_top > 0 and bbox_bottom < room_height and not place_meeting(x, y, track_obj) and not place_meeting(x, y, testTower_obj) {
		draw_set_color(c_grey)
	}
	else {
		draw_set_color(c_red)
	}
	draw_circle(x, y, range, false)

	reset_draw()
}

draw_self()