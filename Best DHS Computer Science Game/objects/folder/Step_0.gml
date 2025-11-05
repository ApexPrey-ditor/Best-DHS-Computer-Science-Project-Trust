if (floor(y) == (room_height - 64) / 2) {
	speed = 0
}
else {
	speed = ((room_height - 64) / 2 - y) / 60 - 0.1
	image_angle -= speed / 5
}