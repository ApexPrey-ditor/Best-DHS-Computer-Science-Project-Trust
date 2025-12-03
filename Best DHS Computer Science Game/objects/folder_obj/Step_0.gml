if (not global.paused) {
	if (dissapate) {
		y -= (y + 512) / 20 + 0.1
		image_xscale -= (image_xscale - 12) / 7
		image_yscale -= (image_xscale - 12) / 7
	
		image_angle += (y + 512) / 256
	
		if (floor(y) == -512) {
			instance_destroy()
		}
	}
	else {
		if (floor(y) != (room_height - 64) / 2) {
			y += ((room_height - 64) / 2 - y) / 60 - 0.1
			image_angle -= (y - yprevious) / 5
		}
	}
}