// draw lives
draw_set_color(c_black)
draw_text(10, 10, "Lives: " + string(global.health))
draw_text(10, 30, "Wave: " + string(global.wave))
draw_text(10, 50, "Money: " + string(global.money))

reset_draw()

draw_set_color(c_blue)
draw_rectangle(room_width - 384, 0, room_width, room_height, false)

reset_draw()

for (var i = 0; i < 4; i++) {
	for (var w = 0; w < 2; w++) {
		draw_rectangle(room_width - 336 + w * 160, 352 + i * 160, room_width - 208 + w * 160, 480 + i * 160, false)
		
		draw_set_color(c_black)
		center_text()
		switch (page * 8 + i * 2 + w) {
			case 0:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Gunner")
				break;
			case 1:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Snipper")
				break;
			case 2:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Railgunner")
				break;
			case 3:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Evaporator")
				break;
			case 4:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Boomer")
				break;
			case 5:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Flamer")
				break;
			case 6:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Puncher")
				break;
			case 7:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Laser")
				break;
			case 8:
				draw_text(room_width - 272 + w * 160, 416 + i * 160, "Cheerleader")
				break;
		}
		draw_text(room_width - 272 + w * 160, 436 + i * 160, "$" + string(costs[page * 8 + i * 2 + w]))
		
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