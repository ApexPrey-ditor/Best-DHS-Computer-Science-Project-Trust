// if paused or not at the hidden position
if (global.paused or abs((x - (room_width - 1393) / 2) / 20) > 0.1 or abs((y - (room_height + 1289) / 2) / 20) > 0.1) {
	draw_self()
	
	draw_set_colour(make_colour_rgb(0, 255, 106))
	draw_circle(x + 142 + 431 * audio_get_master_gain(0), y + 394, 10, false)
}

reset_draw()