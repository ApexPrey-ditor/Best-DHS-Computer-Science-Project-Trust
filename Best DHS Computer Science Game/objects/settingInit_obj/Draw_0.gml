if (room == radarRoom) {
	draw_set_colour(c_green)
	draw_circle(room_width / 2, room_height / 2, 8, false)
	
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
	
	center_text()
	draw_set_font(archive)
	
	if (prevBlip[2] > 0) {
		draw_set_alpha(prevBlip[2])
		draw_circle(room_width / 2 + dcos(prevBlip[0]) * prevBlip[1], room_height / 2 + -dsin(prevBlip[0]) * prevBlip[1], 12, false)
		draw_text(room_width / 2 + dcos(prevBlip[0]) * prevBlip[1], room_height / 2 + -dsin(prevBlip[0]) * prevBlip[1] - 24, "Stage " + string(global.stage - 1))
	}
	if (nextBlip[2] > 0) {
		draw_set_alpha(nextBlip[2])
		draw_circle(room_width / 2 + dcos(nextBlip[0]) * nextBlip[1], room_height / 2 + -dsin(nextBlip[0]) * nextBlip[1], 12, false)
		draw_text(room_width / 2 + dcos(nextBlip[0]) * nextBlip[1], room_height / 2 + -dsin(nextBlip[0]) * nextBlip[1] - 24, "Intermission " + string(global.stage - 1))
	}
	
	reset_draw()
}