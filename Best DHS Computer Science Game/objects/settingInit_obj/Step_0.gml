if mouse_check_button_pressed(mb_left) and not placing {
	if point_in_rectangle(mouse_x, mouse_y, room_width - 378, 384, room_width - 250, 512) {
		instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj)
		placing = true
	}
}