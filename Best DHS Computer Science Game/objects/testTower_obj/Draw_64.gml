// draws upgrade menu if selected
if selected {
	draw_set_color(c_black)
	center_text()
	draw_text(room_width - 384 / 2, 16, towerNames[towerType])
	
	draw_sprite_ext(towerIcons_spr, towerType, room_width - 352, 32, 0.4, 0.4, 0, c_white, 1)
}