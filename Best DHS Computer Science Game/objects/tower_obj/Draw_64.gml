// draws upgrade menu if selected
if selected {
	draw_set_color(c_white)
	center_text()
	draw_set_font(archive)
	
	if (not tier4) {
		// portrait
		draw_text_transformed(room_width - 384 / 2, 32, towerNames[towerType], 2.5, 2.5, 0)
		draw_sprite_ext(towerIconsHighRes_spr, towerType, room_width - 352, 64, 0.4, 0.4, 0, c_white, 1)
	}
	else {
		// tier 4 portrait
		draw_text_transformed(room_width - 384 / 2, 32, towerNamesT4[towerType], 2.5, 2.5, 0)
		draw_sprite_ext(towerIconsT4HighRes_spr, towerType, room_width - 352, 64, 0.4, 0.4, 0, c_white, 1)
	}
	
	if (special == "s booster") {
		// trageting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 396, room_width - 44, 580, false)
		
		// targeting button
		draw_set_color(c_white)
		draw_button(room_width - 368, 400, room_width - 48, 576, true)
		draw_set_color(c_black)
		center_text()
		draw_set_font(jack)
		draw_text_transformed(room_width - 208, 488, "Set Target", 2, 2, 0)
	}
	else if (special == "s commander") {
		// trageting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 396, room_width - 44, 580, false)
		
		// targeting button
		draw_set_color(c_white)
		draw_button(room_width - 368, 400, room_width - 48, 576, true)
		draw_set_color(c_black)
		center_text()
		draw_set_font(jack)
		draw_text_transformed(room_width - 208, 488, targeting, 1.5, 1.5, 0)
	}
	else if (special = "s hacker") {
		// trageting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 396, room_width - 44, 484, false)
	
		// targeting button
		draw_set_color(c_white)
		draw_set_font(jack)
		draw_button(room_width - 368, 400, room_width - 336 + string_width(targeting), 436, true)
		draw_set_color(c_black)
		draw_set_halign(fa_left)
		draw_text(room_width - 348, 420, targeting)
		
		// targeting button 2
		draw_set_color(c_white)
		draw_button(room_width - 368, 444, room_width - 336 + string_width(targeting2), 480, true)
		draw_set_color(c_black)
		draw_text(room_width - 348, 464, targeting2)
	
		// special targeting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 492, room_width - 44, 580, false)
	
		// special targeting button
		draw_set_color(c_white)
		draw_button(room_width - 64 - string_width(specialTargeting), 496, room_width - 48, 532, true)
		draw_set_color(c_black)
		draw_set_halign(fa_right)
		draw_text_transformed(room_width - 58, 516, specialTargeting, 1, 1, 0)
		
		// special targeting button 2
		draw_set_color(c_white)
		draw_button(room_width - 64 - string_width(specialTargeting2), 540, room_width - 48, 576, true)
		draw_set_color(c_black)
		draw_set_font(jack)
		draw_set_halign(fa_right)
		draw_text_transformed(room_width - 58, 560, specialTargeting2, 1, 1, 0)
	}
	else {
		// trageting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 396, room_width - 44, 484, false)
	
		// targeting button
		draw_set_color(c_white)
		draw_set_font(jack)
		draw_button(room_width - 368, 400, room_width - 336 + string_width(targeting) * 2, 480, true)
		draw_set_color(c_black)
		draw_set_halign(fa_left)
		draw_text_transformed(room_width - 348, 444, targeting, 2, 2, 0)
	
		// special targeting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 492, room_width - 44, 580, false)
	
		// special targeting button
		draw_set_color(c_white)
		draw_button(room_width - 80 - string_width(specialTargeting) * 1.5, 496, room_width - 48, 576, true)
		draw_set_color(c_black)
		draw_set_font(jack)
		draw_set_halign(fa_right)
		draw_text_transformed(room_width - 58, 536, specialTargeting, 1.5, 1.5, 0)
	}
	
	if (special == "debt collector") {
		// levl up display
		draw_set_font(archive)
		draw_set_color(c_white)
		draw_button(room_width - 48, 592, room_width - 368, 896, true)
		draw_set_color(c_black)
		center_text()
		if (kills < effect[2]) {
			draw_text_transformed(room_width - 208, 672, "Level " + string(level), 3, 3, 0)
			draw_text_transformed(room_width - 208, 736, "Next Level In", 3, 3, 0)
			draw_text_transformed(room_width - 208, 800, string(effect[level - 1] - kills) + " Kills", 3, 3, 0)
		}
		else {
			draw_text_transformed(room_width - 208, 736, "Max Level", 3, 3, 0)
		}
	}
	else {
		// updrag button
		draw_set_font(archive)
		draw_set_color(c_white)
		draw_button(room_width - 48, 592, room_width - 368, 896, true)
		draw_set_color(c_black)
		center_text()
		if (array_length(global.upgrades[towerType]) > upgrade) {
			draw_set_valign(fa_top)
			draw_text_ext_transformed(room_width - 208, 592, "$" + string(ceil(costs[towerType][upgrade] * (1 - buffs[6]) * (1 - buffs[13]) * (1 - buffs[14]) * (1 - buffs[15]) * global.modEffects[11])) + " - " + global.upgrades[towerType][upgrade].display, 16, 304 / 2.5, 2.5, 2.5, 0)
			draw_text_ext_transformed(room_width - 208, 592 + string_height_ext("$" + string(ceil(costs[towerType][upgrade] * (1 - buffs[6]) * (1 - buffs[13]) * (1 - buffs[14]) * (1 - buffs[15]) * global.modEffects[11])) + " - " + global.upgrades[towerType][upgrade].display, 16, 300 / 2.5) * 2.5, global.upgrades[towerType][upgrade].desc, 16, 304 / 1.5, 1.5, 1.5, 0)
		}
		else {
			draw_text_transformed(room_width - 208, 736, "Max Level", 3, 3, 0)
		}
	}
	
	// sell button
	// disabled function is unrounded rectangle
	draw_set_color(c_white)
	draw_roundrect_ext(room_width - 32, 960, room_width - 222, 1024, 50, 50, false)
	// draw_button(room_width - 48, 928, room_width - 368, 992, true)
	draw_set_color(c_black)
	center_text()
	if (joathe == 0) {
		draw_text_transformed(room_width - 128, 992, "Fire: $" + string(floor(cost * 0.6)), 2, 2, 0)
	}
	else {
		draw_text_transformed(room_width - 128, 992, "No Regrets", 2, 2, 0)
	}
}

if (targetingSelection) {
	draw_set_alpha(0.1)
	draw_set_color(c_grey)
	draw_rectangle(0, 0, room_width, room_height, false)
	
	reset_draw()
	
	for (var i = 0; i < instance_number(tower_obj); i++) {
		if (instance_find(tower_obj, i) != id and instance_find(tower_obj, i).buffs[4] == 1 and ds_list_find_index(targetable, instance_find(tower_obj, i)) != -1) {
			draw_sprite_ext(testLaser_spr, 0, instance_find(tower_obj, i).x, instance_find(tower_obj, i).y, 0.05, 0.05, 0, c_white, 0.7)
		}
	}
}

if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) and not placing) {
	draw_set_colour(c_red)
	draw_set_font(archive)
	center_text()
	var detectionStrings = []
	for(var i = 0;i < array_length(detections);i++) {
		if (detections[i]) {
			detectionStrings[i] = "Yes"
		}
		else {
			detectionStrings[i] = "No"
		}
	}
	draw_text_transformed(x, y - 130, "Camo Detection: " + detectionStrings[0], 1, 1, 0)
	draw_text_transformed(x, y - 110, "Solid Piercing: " + detectionStrings[1], 1, 1, 0)
	draw_text_transformed(x, y - 90, "Invisibility Imagination: " + detectionStrings[2], 1, 1, 0)
}

reset_draw()