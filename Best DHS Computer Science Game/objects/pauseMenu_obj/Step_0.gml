if (global.paused and goUp) {
	if (abs((y - (room_height - 689) / 2) / 20) > 0.1 or abs((x - ((room_width - 1393) / 2)) / 60) > 0.1) {
		x -= (x - (room_width - 1393) / 2) / 20
		y -= (y - (room_height - 689) / 2) / 20
	}
	else {
		if (sprite_index == pauseMenu_spr) {
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
					sprite_index = logbook_spr
					page = 0
					image_index = 0
				}
				// exit to map
				if (point_in_rectangle(mouse_x, mouse_y, x + 725, y + 457, x + 1225, y + 634)) {
					audio_stop_all()
					global.paused = false
					room_goto(mainMenu)
				}
			}
		}
		else {
			if (showDisplay != -1 and image_index < 5) {
				if (shooting) {
					frame += sprite_get_speed(logbookDesc[showDisplay].spriteShooting) / 60
					if (frame / sprite_get_number(logbookDesc[showDisplay].sprite) > 1) {
						frame = 0
						shooting = false
					}
				}
				else {
					frame += sprite_get_speed(logbookDesc[showDisplay].sprite) / 60
				
					if (frame / sprite_get_number(logbookDesc[showDisplay].sprite) > 5 and array_contains(struct_get_names(logbookDesc[showDisplay]), "spriteShooting")) {
						frame = 0
						shooting = true
					}
				}
			}
			
			if (mouse_check_button_pressed(mb_left)) {
				// left arrow
				if (point_in_rectangle(mouse_x, mouse_y, x + 63, y + 261, x + 176, y + 377)) {
					if (image_index == 0) {
						sprite_index = pauseMenu_spr
						if (global.autostart) {
							image_index = 1
						}
					}
					else {
						image_index -= 1
						page -= 1
					}
				}
				// right arrow
				if (point_in_rectangle(mouse_x, mouse_y, x + 1213, y + 261, x + 1329, y + 377)) {
					if (image_index < 5) {
						image_index += 1
						page += 1
					}
					else if (array_length(global.modifiers) > page * 8 - 32) {
						page += 1
					}
				}
				
				if (showDisplay == -1) {
					for (var i = 0; i < 2; i++) {
						for (var w = 0; w < 4; w++) {
							if (point_in_rectangle(mouse_x, mouse_y, x + (466 + i * 353), y + (38 + w * 160), x + (466 + i * 353) + 295, y + (38 + w * 160) + 131) and (array_contains(global.logbookUnlocks, page * 8 + i * 4 + w) or image_index >= 5)) {
								showDisplay = page * 8 + i * 4 + w
								frame = 0
							}
						}
					}
				}
				else {
					showDisplay = -1
				}
			}
		}
	}
}
else {
	x -= (x - (room_width - 1393) / 2) / 20
	y -= (y - (room_height + 1289) / 2) / 20
}