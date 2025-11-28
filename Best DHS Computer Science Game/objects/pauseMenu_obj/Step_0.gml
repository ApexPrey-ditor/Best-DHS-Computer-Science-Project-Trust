if (global.paused) {
	if (abs((y - (room_height - 689) / 2) / 60) > 0.1 or abs((x - ((room_width - 1393) / 2)) / 60) > 0.1) {
		x -= (x - ((room_width - 1393) / 2)) / 20
		y -= (y - (room_height - 689) / 2) / 20
	}
}
else {
	x -= (x - ((room_width - 1393) / 2)) / 20
	y -= (y - (room_height + 1289) / 2) / 20
}