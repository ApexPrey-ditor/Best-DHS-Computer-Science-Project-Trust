if (mouse_check_button_pressed(mb_left) and not placing and not global.upgradeMenu and not global.paused) {
	for (var i = 0; i < 4; i++) {
		for (var w = 0; w < 2; w++) {
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 336 + w * 160, 240 + i * 160, room_width - 208 + w * 160, 368 + i * 160)) and global.money >= costs[page * 8 + i * 2 + w] {
				switch (page * 8 + i * 2 + w) {
					case 0:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 1:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 7, fireSpeed : 90, range : 500, projSpeed : 25, cost : costs[page * 8 + i * 2 + w], sprite_index : snipper_spr})
						placing = true
						break;
					case 2:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 75, fireSpeed : 300, range : 550, projSpeed : -5, cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 3:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 1000, fireSpeed : 600, range : 400, projSpeed : 40, cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 4:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 2, fireSpeed : 60, range : 200, projSpeed : 5, aoe : 3, cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 5:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 5, fireSpeed : 120, range : 150, projSpeed : 5, special : "flame", cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 6:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 5, fireSpeed : 30, range : 100, projSpeed : 0, cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 7:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 6, fireSpeed : 12, range : 0, projSpeed : -10, special : "laser", cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 8:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 0, fireSpeed : 1.1, range : 300, projSpeed : 0, special : "firerate", cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
					case 9:
						instance_create_layer(mouse_x, mouse_y, "Towers", testTower_obj, {damage : 100, fireSpeed : 0, range : 0, projSpeed : 0, special : "money", cost : costs[page * 8 + i * 2 + w]})
						placing = true
						break;
				}
			}
		}
	}
	
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 336, room_height - 208, room_width - 48, room_height - 128)) {
		page = not page
	}
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 336, room_height - 96, room_width - 48, room_height - 16)) {
		if (enemySpawner_obj.enemies == 0 and enemySpawner_obj.points <= 0) {
			global.waveTransition = 1
		}
		else if (global.fastForward == 1) {
			global.fastForward = 3
		}
		else {
			global.fastForward = 1
		}
	}
}