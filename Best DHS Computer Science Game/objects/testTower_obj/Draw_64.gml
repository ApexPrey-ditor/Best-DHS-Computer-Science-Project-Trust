// draws upgrade menu if selected
if selected {
	draw_set_color(c_black)
	center_text()
	draw_set_font(archive)
	draw_text_transformed(room_width - 384 / 2, 32, towerNames[towerType], 2.5, 2.5, 0)
	// draw_text(room_width - 384 / 2, 16, towerNames[towerType])
	
	draw_sprite_ext(towerIcons_spr, towerType, room_width - 352, 64, 0.4, 0.4, 0, c_white, 1)
	
	draw_set_color(c_white)
	draw_button(room_width - 48, 448, room_width - 368, 512, true)
	
	draw_button(room_width - 48, 576, room_width - 368, 832, true)
	draw_set_color(c_black)
	draw_text_transformed(room_width - 208, 704, "updrag", 3, 3, 0)
	
	draw_set_color(c_white)
	draw_button(room_width - 48, 896, room_width - 368, 960, true)
	draw_set_color(c_black)
	draw_text_transformed(room_width - 208, 928, "kill thyself", 3, 3, 0)
}

reset_draw()