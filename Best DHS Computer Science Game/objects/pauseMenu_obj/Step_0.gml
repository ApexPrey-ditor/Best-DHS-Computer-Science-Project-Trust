if (global.paused) {
	if (abs((y - (room_height - 689) / 2) / 20) > 0.1 or abs((x - ((room_width - 1393) / 2)) / 60) > 0.1) {
		x -= (x - (room_width - 1393) / 2) / 20
		y -= (y - (room_height - 689) / 2) / 20
	}
	else {
		// 637, 210
		if (mouse_check_button_pressed(mb_left)) {
			if (point_in_rectangle(mouse_x, mouse_y, x + 137, y + 33, x + 637, y + 210)) {
				global.paused = false
				
				// resets alarm of every sprite
				with (all) {
					if (object_index == tower_obj or object_index == enemy_obj) {
						image_speed = pausedAnimSpeed
					}
					for (var i = 0; i < 12; i++) {
						alarm[i] = alarmList[i]	
					}
		
					alarmList = []
				}
			}
		}
	}
}
else {
	x -= (x - (room_width - 1393) / 2) / 20
	y -= (y - (room_height + 1289) / 2) / 20
}