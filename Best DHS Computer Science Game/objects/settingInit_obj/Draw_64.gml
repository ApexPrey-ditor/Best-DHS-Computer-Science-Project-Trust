// draw lives
draw_set_color(c_black)
draw_text(10, 10, "Lives: " + string(global.health))
draw_text(10, 30, "Wave: " + string(global.wave))

reset_draw()

draw_set_color(c_blue)
draw_rectangle(room_width - 384, 0, room_width, room_height, false)

reset_draw()

for (var i = 0; i < 4; i++) {
	for (var w = 0; w < 2; w++) {
		draw_rectangle(room_width - 336 + w * 160, 352 + i * 160, room_width - 208 + w * 160, 480 + i * 160, false)
		
		draw_set_color(c_black)
		center_text()
		switch (i * 2 + w) {
			case 0:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Gunner")
				}
				else {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Cheerleader")
				}
				break;
			case 1:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Snipper")
				}
				break;
			case 2:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Railgunner")
				}
				break;
			case 3:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Evaporator")
				}
				break;
			case 4:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Boomer")
				}
				break;
			case 5:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Flamer")
				}
				break;
			case 6:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Puncher")
				}
				break;
			case 7:
				if page == 0 {
					draw_text(room_width - 272 + w * 160, 416 + i * 160, "Laser")
				}
				break;
		}
		
		reset_draw()
	}
}

draw_rectangle(room_width - 336, room_height - 96, room_width - 48, room_height - 16, false)
if page == 0 {
	center_text()
	draw_set_color(c_black)
	draw_text(room_width - 192, room_height - 48, "Single-target/Crowd Control")
}
else {
	center_text()
	draw_set_color(c_black)
	draw_text(room_width - 192, room_height - 48, "Support/General")
}

reset_draw()