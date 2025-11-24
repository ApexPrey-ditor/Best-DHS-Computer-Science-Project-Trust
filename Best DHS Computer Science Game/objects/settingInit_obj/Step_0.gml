// if mouse clicked and not placing tower, not selected tower and not paused
if (mouse_check_button_pressed(mb_left) and not placing and not global.upgradeMenu and not global.paused and room != radarRoom) {
	// goes through the 4 y positions the buttons can be
	for (var i = 0; i < 4; i++) {
		// goes through the 2 x positions the buttons can be
		for (var w = 0; w < 2; w++) {
			// checks if mouse is in one of the buttons
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 336 + w * 160, 240 + i * 160, room_width - 208 + w * 160, 368 + i * 160) and global.money >= ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]) and global.towers < ceil(global.modEffects[16])) {
				switch (page * 8 + i * 2 + w) {
					// makes a tower based on what button you clicked
					case 0:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11])})
						placing = true
						break;
					case 1:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 7, fireSpeed : 90, range : 500, detections : [true, false, false], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 2:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 75, fireSpeed : 300, range : 550, detections : [true, false, false], type : 1, pierce : 20, cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 3:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 1000, fireSpeed : 600, range : 400, detections : [false, false, true], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 4:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 2, fireSpeed : 60, range : 200, pierce : 10, detections : [false, true, false], aoe : 3, type : 3, lifetime : -1, projSpeed : 5, cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 5:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 0.5, aoe : 1, fireSpeed : 30, range : 150, detections : [false, true, false], spread : 10, type : 3, projSpeed : 5, lifetime : 60, special : "flame", effect : [1/20, 200], type : 3, cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 6:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 5, fireSpeed : 30, range : 100, type : 2, pierce : 5, aoe : 5, cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 7:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 3, fireSpeed : 12, range : 50, pierce : 100, aoe : 5, special : "laser", cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 8:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 0, fireSpeed : 0, range : 300, special : "s firerate", effect : [1.1], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 9:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 0, fireSpeed : 0, range : 50, effect: [100], special : "money", cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 10:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 0, fireSpeed : 0, range : 400, detections : [true, false, false], special : "s spotter", effect : [1.1, 1.15], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 11:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 0, fireSpeed : 0, range : 350, special : "s booster", effect : [1.4], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 12:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 50, fireSpeed : 600, range : 450, pierce : 10, aoe : 3, lifetime : 60, type : 1, projSpeed : 0, special : "s commander", effect : [1.15], detections : [true, true, false], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 13:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 5, fireSpeed : 12, range : 400, pierce : 1, lifetime : 12, type : 2, special : "s hacker", effect : [0.05], detections : [true, true, true], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 14:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 5, fireSpeed : 12, range : 100, pierce : 10, type : 2, special : "rapper", detections : [false, false, true], effect : [250], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
					case 15:
						instance_create_depth(mouse_x, mouse_y, 0, tower_obj,
						{damage : 3, fireSpeed : 60, range : 250, type : 3, spread : 15, projSpeed : 10, special : "debt collector", effect : [100, 350, 1100, 2, 1], cost : ceil(costs[page * 8 + i * 2 + w] * global.modEffects[11]), towerType : page * 8 + i * 2 + w})
						placing = true
						break;
				}
			}
		}
	}
	
	// checks if mouse is in page button
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 336, room_height - 208, room_width - 48, room_height - 128)) {
		page = not page
	}
	if (point_in_rectangle(mouse_x, mouse_y, room_width - 336, room_height - 96, room_width - 48, room_height - 16)) {
		// starts wave
		if (enemySpawner_obj.enemies == 0 and enemySpawner_obj.points <= 0) {
			if (global.wave - 1 != global.stage * 2) {
				global.waveTransition = 1
			}
			else {
				global.stage += 1
				room_goto(radarRoom)
			}
		}
		// fast forward
		else if (global.fastForward == 1) {
			global.fastForward = 3
			with (all) {
				for (var i = 0; i < 12; i++) {
					alarm[i] = ceil(alarm[i] / 3)
				}
			}
		}
		// unfast forward
		else {
			global.fastForward = 1
			with (all) {
				for (var i = 0; i < 12; i++) {
					alarm[i] = alarm[i] * 3
				}
			}
		}
	}
}

if (room == radarRoom and selection != 1) {
	radarDir -= 2

	nextBlip[1] -= 1
	prevBlip[1] += 1
	
	if (360 + (radarDir % 360) == nextBlip[0]) {
		nextBlip[2] = 1
	}
	if (360 + (radarDir % 360) == prevBlip[0]) {
		prevBlip[2] = 1
	}
	
	nextBlip[2] -= 1 / 90
	prevBlip[2] -= 1 / 90
	
	if (nextBlip[1] <= 0) {
		if (selection == 0) {
			selection = 1
			instance_create_layer(960, 1440, "Folder", folder)
		}
		else {
			room_goto(testTrack)
		}
	}
}

/*
if (enemySpawner_obj.enemies == 0 and enemySpawner_obj.points <= 0) {
	global.waveTransition = 1
}
/*