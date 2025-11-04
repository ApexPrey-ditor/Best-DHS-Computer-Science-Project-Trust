if (room == radarRoom) {
	draw_set_colour(c_green)
	draw_circle(room_width / 2, room_height / 2, 10, false)
	
	draw_line_width(room_width / 2, room_height / 2, room_width / 2 + dcos(radarDir) * 512, room_height / 2 + -dsin(radarDir) * 512, 10)
	
	for (var i = 0; i < 30; i++) {
		draw_set_alpha((31 - i) / 62)
		draw_line_width(room_width / 2, room_height / 2, room_width / 2 + dcos(radarDir + i) * 512, room_height / 2 + -dsin(radarDir + i) * 512, 10)
	}
	
	draw_set_alpha(0.15)
	draw_set_circle_precision(40)
	draw_circle(room_width / 2, room_height / 2, 512, false)
	
	for (var i = -7; i < 8; i++) {
		draw_line(room_width / 2 + (i * 64), room_height / 2 + sqrt(262144 - power(i * 64, 2)), room_width / 2 + (i * 64), room_height / 2 - sqrt(262144 - power(i * 64, 2)))
		draw_line(room_width / 2 + sqrt(262144 - power(i * 64, 2)), room_height / 2 + (i * 64), room_width / 2 - sqrt(262144 - power(i * 64, 2)), room_height / 2 + (i * 64))
	}
	
	draw_set_alpha(1)
	
	draw_set_circle_precision(28)
	draw_circle(room_width / 2, room_height / 2, 128, true)
	draw_set_circle_precision(32)
	draw_circle(room_width / 2, room_height / 2, 256, true)
	draw_set_circle_precision(36)
	draw_circle(room_width / 2, room_height / 2, 384, true)
	draw_set_circle_precision(40)
	draw_circle(room_width / 2, room_height / 2, 512, true)
	
	draw_line(room_width / 2, room_height / 2 - 512, room_width / 2, room_height / 2 + 512)
	draw_line(room_width / 2 - 512, room_height / 2, room_width / 2 + 512, room_height / 2)
	
	draw_set_alpha(prevBlip[2])
	draw_circle(room_width / 2 + dcos(prevBlip[0]) * prevBlip[1], room_height / 2 + -dsin(prevBlip[0]) * prevBlip[1], 15, false)
	
	draw_set_alpha(nextBlip[2])
	draw_circle(room_width / 2 + dcos(nextBlip[0]) * nextBlip[1], room_height / 2 + -dsin(nextBlip[0]) * nextBlip[1], 15, false)
	
	reset_draw()
}
else {
	// draws blue background square
	draw_set_color(make_colour_rgb(81, 83, 99))
	draw_rectangle(room_width - 384, 0, room_width, room_height, false)

	reset_draw()

	// draws if upgrade menu not open
	if (not global.upgradeMenu) {
		// draw lives, wave and money
		draw_set_color(c_black)
		draw_set_font(archive)
		draw_text_transformed(room_width - 352, 10, "Lives: " + string(global.health), 3, 3, 0)
		draw_text_transformed(room_width - 352, 74, "Wave: " + string(max(global.wave, 1)) + "/" + string(global.stage * 2), 3, 3, 0)
		draw_text_transformed(room_width - 352, 138, "Money: " + string(global.money), 3, 3, 0)

		reset_draw()
	
		// goes through the 4 y positions the buttons can be
		for (var i = 0; i < 4; i++) {
			// goes through the 2 x positions the buttons can be
			for (var w = 0; w < 2; w++) {
				// draws button based on i and w
				draw_rectangle(room_width - 336 + w * 160, 240 + i * 160, room_width - 208 + w * 160, 368 + i * 160, false)
		
				draw_set_color(c_black)
				draw_set_font(archive)
				center_text()
				// draws tower name based on page, x, and y
				switch (page * 8 + i * 2 + w) {
					case 0:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Gunner")
						break;
					case 1:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Sniper")
						break;
					case 2:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Railgunner")
						break;
					case 3:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Evaporator")
						break;
					case 4:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Boomer")
						break;
					case 5:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Flamer")
						break;
					case 6:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Puncher")
						break;
					case 7:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Laser")
						break;
					case 8:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Cheerleader")
						break;
					case 9:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Moneymaker")
						break;
					case 10:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Spotter")
						break;
					case 11:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Booster")
						break;
					case 12:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Commander")
						break;
					case 13:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Hacker")
						break;
					case 14:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Rapper")
						break;
					case 15:
						draw_text(room_width - 272 + w * 160, 304 + i * 160, "Debt Collector")
						break;
				}
				// draws cost based on page, x, and y
				draw_text(room_width - 272 + w * 160, 334 + i * 160, "$" + string(costs[page * 8 + i * 2 + w]))
		
				reset_draw()
			}
		}

		// draws the page switch button
		draw_rectangle(room_width - 336, room_height - 208, room_width - 48, room_height - 128, false)
		if (page == 0) {
			// if on page 1
			center_text()
			draw_set_color(c_black)
			draw_set_font(archive)
			draw_text(room_width - 192, room_height - 160, "Single-target/Crowd Control")
		}
		else {
			// if on page 2
			center_text()
			draw_set_color(c_black)
			draw_set_font(archive)
			draw_text(room_width - 192, room_height - 160, "Support/General")
		}

		reset_draw()
	
		// draw start wave/fast foward button
		draw_rectangle(room_width - 336, room_height - 96, room_width - 48, room_height - 16, false)
	
		center_text()
		draw_set_color(c_black)
		draw_set_font(jack)
	
		if (enemySpawner_obj.enemies == 0 and enemySpawner_obj.points <= 0) {
			// if not in a wave
			if (global.wave != global.stage * 2) {
				draw_text(room_width - 192, room_height - 48, "Start Wave")
			}
			else {
				draw_text(room_width - 192, room_height - 48, "Next Stage")
			}
		}
		else if (global.fastForward == 1) {
			draw_text(room_width - 192, room_height - 48, "x1 Speed")
		}
		else {
			draw_text(room_width - 192, room_height - 48, "x3 Speed")
		}
	
		reset_draw()
	}

	draw_set_color(c_black)
	draw_text(10, 30, global.paused)
}