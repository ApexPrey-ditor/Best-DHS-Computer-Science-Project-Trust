// draw a grey circle that corresponds to the towers range

if (placing) {
	draw_set_alpha(0.5)
	if (bbox_right < room_width - 384 and bbox_left > 0 and bbox_top > 0 and bbox_bottom < room_height and not place_meeting(x, y, track_obj) and not place_meeting(x, y, tower_obj)) {
		draw_set_color(c_grey)
	}
	else {
		draw_set_color(c_red)
	}
	draw_circle(x, y, range * buffs[2] * buffs[12] * multis[2], false)

	reset_draw()
}
if (selected) {
	draw_set_alpha(0.5)
	draw_set_color(c_grey)
	draw_circle(x, y, range * buffs[2] * buffs[12] * multis[2], false)
	
	reset_draw()
}

draw_set_color(c_red)

if (array_length(drawPercents) > 0) {
	for (var i = 0; i < array_length(drawPercents); i++) {
		if (type == 0) {
			draw_line_width(x - ((x - finalPositions[i][0]) * max(drawPercents[i] - 0.2, 0)), y - (( y - finalPositions[i][1]) * max(drawPercents[i] - 0.2, 0)), x - ((x - finalPositions[i][0]) * min(drawPercents[i] + 0.2, 1)), y - ((y - finalPositions[i][1]) * min(drawPercents[i] + 0.2, 1)), 5)
		}
		else if (type == 2) {
			draw_line_width(x, y, finalPositions[i][0], finalPositions[i][1], aoe * multis[4])
		}
		else {
			draw_line_width(x, y, finalPositions[i][0], finalPositions[i][1], 7)
		}
	}
}
if (special == "laser" and not placing) {
	if (not tier4) {
		draw_line_width(0, y - (168 * 0.4 * global.modEffects[10]), room_width, y - (168 * 0.4 * global.modEffects[10]), aoe * multis[4] * 2)
	}
	else {
		draw_set_color(c_red)
		draw_circle(x, y, 100 + (aoe * multis[5] * 20), false)
	}
}
if (special == "s hacker") {
	for (var i = 0; i < array_length(follows); i++) {
		if (instance_exists(follows[i])) {
			draw_line_width(x, y, follows[i].x, follows[i].y, 10)
		}
	}
}

reset_draw()

draw_self()