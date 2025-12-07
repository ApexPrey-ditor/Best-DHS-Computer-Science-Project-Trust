if (global.paused) {
	if (abs((y - (room_height - 689) / 2) / 20) > 0.1 or abs((x - ((room_width - 1393) / 2)) / 60) > 0.1) {
		x -= (x - (room_width - 1393) / 2) / 20
		y -= (y - (room_height - 689) / 2) / 20
	}
	else {
		if (mouse_check_button(mb_left)) {
			// volume
			if (point_in_rectangle(mouse_x, mouse_y, x + 132, y + 384, x + 575, y + 404)or adjusting) {
				audio_master_gain(max(min((mouse_x - 142 - x) / 431, 1), 0))
				
				adjusting = true
			}
		}
		else {
			adjusting = false
		}
		if (mouse_check_button_pressed(mb_left)) {
			// resume
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
			// autostart
			if (point_in_rectangle(mouse_x, mouse_y, x + 378, y + 246, x + 427, y + 294)) {
				global.autostart = not global.autostart
				
				image_index += 1
			}
			// logbook
			if (point_in_rectangle(mouse_x, mouse_y, x + 725, y + 253, x + 1225, y + 430)) {
				// its gonna do logbook stuff
			}
			// exit to map
			if (point_in_rectangle(mouse_x, mouse_y, x + 725, y + 457, x + 1225, y + 634)) {
				game_end()
			}
		}
	}
}
else {
	x -= (x - (room_width - 1393) / 2) / 20
	y -= (y - (room_height + 1289) / 2) / 20
}