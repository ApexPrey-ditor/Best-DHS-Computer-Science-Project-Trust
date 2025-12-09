// if paused or not at the hidden position
if (global.paused or abs((x - (room_width - 1393) / 2) / 20) > 0.1 or abs((y - (room_height + 1289) / 2) / 20) > 0.1) {
	draw_self()
	
	draw_set_colour(make_colour_rgb(0, 255, 106))
	
	if (sprite_index == pauseMenu_spr) {
		draw_circle(x + 142 + 431 * audio_get_master_gain(0), y + 394, 10, false)
	}
	else {
		draw_set_font(flopthing)
		
		if (showDisplay == -1) {
			center_text()
			
			for (var i = 0; i < 2; i++) {
				for (var w = 0; w < 4; w++) {
					draw_roundrect_ext(x + (466 + i * 353), y + (38 + w * 160), x + (466 + i * 353) + 295, y + (38 + w * 160) + 131, 5, 5, false)
					draw_set_colour(c_black)
					draw_roundrect_ext(x + (466 + i * 353) + 8, y + (38 + w * 160) + 8, x + (466 + i * 353) + 295 - 8, y + (38 + w * 160) + 131 - 8, 5, 5, false)
					draw_set_colour(make_colour_rgb(0, 255, 106))
					if (array_contains(global.logbookUnlocks, image_index * 8 + i * 4 + w)) {
						draw_text_transformed(x + (466 + i * 353) + 295 / 2, y + (38 + w * 160) + 131 / 2, logbookEntries[image_index * 8 + i * 4 + w], 1, 1, 0)
					}
					else {
						draw_text_transformed(x + (466 + i * 353) + 295 / 2, y + (38 + w * 160) + 131 / 2, "Unknown", 1, 1, 0)
					}
				}
			}
		}
		else {
			draw_text_transformed(x + 474, y + 46, logbookDesc[showDisplay].title, 2, 2, 0)
			draw_text_ext_transformed(x + 474, y + 62 + 64, logbookDesc[showDisplay].desc, 48, 1408, 0.5, 0.5, 0)
			draw_sprite(logbookDesc[showDisplay].sprite, frame, x + 1016, y + 96 + 64 + 104 + string_height_ext(logbookDesc[showDisplay].desc, 48, 1408))
			
		}
	}
}

reset_draw()