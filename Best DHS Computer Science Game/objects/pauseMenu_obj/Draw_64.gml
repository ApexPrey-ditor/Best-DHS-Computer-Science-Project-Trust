// if paused or not at the hidden position
if (global.paused or abs((x - (room_width - 1393) / 2) / 20) > 0.1 or abs((y - (room_height + 1289) / 2) / 20) > 0.1) {
	draw_self()
}

reset_draw()