if (mouse_check_button_pressed(mb_left) and not placing) {
	for (var i = 0; i < 4; i++) {
		for (var w = 0; w < 2; w++) {
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 336 + w * 160, 352 + i * 160, room_width - 208 + w * 160, 480 + i * 160)) {
				switch (page * 8 + i * 2 + w) {
					case 0:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj)
						placing = true
						break;
					case 1:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 7, fireSpeed : 60, range : 500, projSpeed : 25, sprite_index : snipper_spr})
						placing = true
						break;
					case 2:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 75, fireSpeed : 300, range : 550, projSpeed : -5})
						placing = true
						break;
					case 3:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 1000, fireSpeed : 600, range : 400, projSpeed : 40})
						placing = true
						break;
					case 4:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 1, fireSpeed : 60, range : 200, projSpeed : 5, aoe : 3})
						placing = true
						break;
					case 5:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 5, fireSpeed : 120, range : 150, projSpeed : 5, special : "flame"})
						placing = true
						break;
					case 6:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 5, fireSpeed : 30, range : 100, projSpeed : 0})
						placing = true
						break;
					case 7:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 5, fireSpeed : 10, range : 0, projSpeed : -10, special : "laser"})
						placing = true
						break;
					case 8:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 0, fireSpeed : 5, range : 300, projSpeed : 0, special : "firerate"})
						placing = true
						break;
				}
			}
		}
	}
	
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 336, room_height - 96, room_width - 48, room_height - 16)) {
		page = not page
	}
}