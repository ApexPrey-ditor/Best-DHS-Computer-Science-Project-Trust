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
	
	// targeting button
	draw_set_color(c_white)
	draw_button(room_width - (208 - (string_length(targeting) - 4) * 32), 448, room_width - 368, 528, true)
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_set_font(jack)
	draw_text_transformed(room_width - 348, 492, targeting, 2, 2, 0)
	center_text()
	
	// updrag button
	draw_set_font(archive)
	draw_set_color(c_white)
	draw_button(room_width - 48, 576, room_width - 368, 896, true)
	draw_set_color(c_black)
	draw_text_transformed(room_width - 208, 736, "updrag", 3, 3, 0)
	
	// sell button
	// disabled function is unrounded rectangle
	draw_set_color(c_white)
	draw_roundrect_ext(room_width - 32, 944, room_width - 222, 1040, 50, 50, false)
	// draw_button(room_width - 48, 928, room_width - 368, 992, true)
	draw_set_color(c_black)
	draw_text_transformed(room_width - 128, 992, "kill thyself", 1.5, 1.5, 0)
}

reset_draw()