if mouse_check_button_pressed(mb_left) and not placing {
	if point_in_rectangle(mouse_x, mouse_y, room_width - 352, 384, room_width - 224, 512) {
		instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj)
		placing = true
	}
	if point_in_rectangle(mouse_x, mouse_y, room_width - 160, 384, room_width - 32, 512) {
		instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 7, fireSpeed : 60, range : 500, projSpeed : 25, sprite_index:snipper_spr})
		placing = true
	}
}