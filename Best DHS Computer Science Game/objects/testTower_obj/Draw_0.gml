// draw a grey circle that corresponds to the towers range

if (placing) {
	draw_set_alpha(0.5)
	if (bbox_right < room_width - 384 and bbox_left > 0 and bbox_top > 0 and bbox_bottom < room_height and not place_meeting(x, y, track_obj) and not place_meeting(x, y, testTower_obj)) {
		draw_set_color(c_grey)
	}
	else {
		draw_set_color(c_red)
	}
	draw_circle(x, y, range * buffs[2], false)

	reset_draw()
}
if (selected) {
	draw_set_alpha(0.5)
	draw_set_color(c_grey)
	draw_circle(x, y, range * buffs[2], false)
	
	reset_draw()
}

draw_set_color(c_red)

if (array_length(drawPercents) > 0) {
	for (var i = 0; i < array_length(drawPercents); i++) {
		if (type == 0) {
			draw_line_width(x - ((x - finalPositions[i][0]) * max(drawPercents[i] * 1.2 - 0.2, 0)), y - (( y - finalPositions[i][1]) * max(drawPercents[i] * 1.2 - 0.2, 0)), x - ((x - finalPositions[i][0]) * max(drawPercents[i] * 1.2, 0)), y - ((y - finalPositions[i][1]) * max(drawPercents[i] * 1.2, 0)), 5)
		}
		else {
			draw_line_width(x, y, finalPositions[i][0], finalPositions[i][1], 7)
		}
	}
}
if (special == "laser" and not placing) {
	draw_line_width(0, y, room_width, y, 10)
}
if (special == "s hacker" and instance_exists(follow)) {
	draw_line_width(x, y, follow.x, follow.y, 10)
}

reset_draw()

draw_self()