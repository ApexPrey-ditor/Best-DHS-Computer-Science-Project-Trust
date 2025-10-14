// draws upgrade menu if selected
if selected {
	draw_set_color(c_black)
	center_text()
	draw_set_font(archive)
	draw_text_transformed(room_width - 384 / 2, 32, towerNames[towerType], 2.5, 2.5, 0)
	draw_text(10, 10, mouse_x > room_width - (208 - (string_length(targeting) - 5) * 36))
	// draw_text(room_width - 384 / 2, 16, towerNames[towerType])
	
	// portrait
	draw_sprite_ext(towerIcons_spr, towerType, room_width - 352, 64, 0.4, 0.4, 0, c_white, 1)
	
	if (special == "s booster") {
		// trageting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 396, room_width - 44, 580, false)
		
		// targeting button
		draw_set_color(c_white)
		draw_button(room_width - 368, 400, room_width - 48, 576, true)
		draw_set_color(c_black)
		draw_set_halign(fa_left)
		draw_set_font(jack)
		draw_text_transformed(room_width - 348, 488, "Set Target", 2, 2, 0)
	}
	else {
		// trageting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 396, room_width - 44, 484, false)
	
		// targeting button
		draw_set_color(c_white)
		draw_button(room_width - 368, 400, room_width - (208 - (string_length(targeting) - 4) * 32), 480, true)
		draw_set_color(c_black)
		draw_set_halign(fa_left)
		draw_set_font(jack)
		draw_text_transformed(room_width - 348, 444, targeting, 2, 2, 0)
	
		// special targeting button background
		draw_set_color(make_colour_rgb(40, 41, 48))
		draw_rectangle(room_width - 372, 492, room_width - 44, 580, false)
	
		// special targeting button
		draw_set_color(c_white)
		draw_button(room_width - (160 + (string_length(specialTargeting) - 4) * 16), 496, room_width - 48, 576, true)
		draw_set_color(c_black)
		draw_set_font(jack)
		draw_set_halign(fa_right)
		draw_text_transformed(room_width - 58, 536, specialTargeting, 1.5, 1.5, 0)
	}
	
	// updrag button
	draw_set_font(archive)
	draw_set_color(c_white)
	draw_button(room_width - 48, 592, room_width - 368, 896, true)
	draw_set_color(c_black)
	center_text()
	draw_text_transformed(room_width - 208, 736, "updrag", 3, 3, 0)
	
	// sell button
	// disabled function is unrounded rectangle
	draw_set_color(c_white)
	draw_roundrect_ext(room_width - 32, 944, room_width - 222, 1040, 50, 50, false)
	// draw_button(room_width - 48, 928, room_width - 368, 992, true)
	draw_set_color(c_black)
	draw_text_transformed(room_width - 128, 992, "kill thyself", 1.5, 1.5, 0)
}

if (targetingSelection) {
	draw_set_alpha(0.1)
	draw_set_color(c_grey)
	draw_rectangle(0, 0, room_width, room_height, false)
	
	reset_draw()
	
	for (var i = 0; i < instance_number(testTower_obj); i++) {
		if (instance_find(testTower_obj, i) != id and instance_find(testTower_obj, i).buffs[4] == 1 and ds_list_find_index(targetable, instance_find(testTower_obj, i)) != -1) {
			draw_sprite_ext(testLaser_spr, 0, instance_find(testTower_obj, i).x, instance_find(testTower_obj, i).y, 0.05, 0.05, 0, c_white, 0.7)
		}
	}
}

reset_draw()