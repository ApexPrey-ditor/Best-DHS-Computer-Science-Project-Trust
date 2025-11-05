if (floor(y) == (room_height + 64) / 2) {
	speed = 0
}
else {
	speed = ((room_height + 64) / 2 - y) / 60 + 1
	if (floor(image_angle) != 0) {
		image_angle += -image_angle / 60 + 0.02
	}
}