if (not global.paused) {
	if (not placing) {
		if (mouse_check_button_pressed(mb_left)) {
			// checks if theres a tower under the mouse when clicked
			if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
				selected = not selected
				global.upgradeMenu = selected
			}
			else {
				if (mouse_x < room_width - 384) {
					selected = false
					// deselects the upgrade menu if clicking empty space
					if (not position_meeting(mouse_x, mouse_y, tag_get_asset_ids("Tower", asset_object))) {
						global.upgradeMenu = selected
					}
				}
			}
		}
	}

	if (placing) {
		// makes it go to the mouse
		x = mouse_x
		y = mouse_y
	
		// places tower if not colliding with track or other towers
		if (mouse_check_button_pressed(mb_left) and bbox_right < room_width - 384 and bbox_left > 0 and bbox_top > 0 and bbox_bottom < room_height and not place_meeting(x, y, track_obj) and not place_meeting(x, y, testTower_obj)) {
			placing = false
			settingInit_obj.placing = false
			global.money -= cost
		}
		// destroys tower if sent in the tower menu after pulled out of it
		if ((xprevious < room_width - 384 or mouse_check_button_pressed(mb_left)) and x > room_width - 384) {
			settingInit_obj.placing = false
			instance_destroy()
		}
	}
	// checks if the tower isnt the money making tower
	else if (special != "money") {
		if (range > 50) {
			if (special != "firerate") {
				if (not firing) {
					// finds targets
					var options = ds_list_create()
					var unsorted = ds_list_create()
					collision_circle_list(x, y, range, tag_get_asset_ids("Enemy", asset_object), false, true, unsorted, false)
				
					// removes all the enemies that are ghost dead, or cant be detected
					unsorted = remove_undetectable(unsorted, detections)
				
					// sorts enemies by furthest along path
					repeat (ds_list_size(unsorted)) {
						ds_list_add(options, ds_list_find_value(unsorted, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(unsorted)))
						ds_list_delete(unsorted, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(unsorted))
					}

					if (ds_list_size(options) > 0) {
						// initializes variables needed for targeting
						var chosen = 0
						var currentScore = 0
						var highscore = 0
						var target = noone
				
						// conditions is an array of functions that are used to generate targeting score
						// iterates through every targeting function and adds the output to highscore
						// this gives the first value the starting highscore
						for (var i = 0; i < array_length(conditions); i++) {
							highscore += conditions[i](options, ds_list_size(options) - 1, chosen, i)
						}
				
						// iterates through every enemy in range
						for (var i = 0; i < ds_list_size(options); i++) {
							// adds the score of the targeting functions to currentScore
							currentScore = 0
							for (var w = 0; w < array_length(conditions); w++) {
								currentScore += conditions[w](options, chosen, i, w)
							}
					
							// if beats highscore then this becomes the new target
							if (currentScore >= highscore) {
								//show_debug_message(string())
								highscore = currentScore
								chosen = i
							}
						}
				
						// gets instance id of the "winner" (they are going to die)
						target = ds_list_find_value(options, chosen)
					
						var targets = ds_list_create()
						
						// extends the collision line to the edge of the screen
						var xpos = x
						var ypos = y
					
						if (type != 2) {
							while (abs(xpos) < room_width and abs(y) < room_height) {
								xpos += target.x - x
								ypos += target.y - y
							}
						}
						else {
							xpos += dcos(point_direction(x, y, target.x, target.y)) * range
							ypos -= dsin(point_direction(x, y, target.x, target.y)) * range
						}
						
						// gets every enemy in the collision line
						collision_line_list(x, y, xpos, ypos, tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
					
						// removes all the enemies that are ghost dead, or cant be detected
						targets = remove_undetectable(targets, detections)
					
						if (type == 0) {
							for (var i = 0; i < min(ds_list_size(targets), pierce); i++) {
								// iterates through the amount of enemies tower is allowed to hit
								ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), detections, damage)
								if ds_list_find_value(targets, i).hp <= 0 {
									// dead enemies are set to ghosts
									ds_list_find_value(targets, i).deactivated = true
									ds_list_find_value(targets, i).alarm[11] = lifetime
								}
							
								if i == pierce - 1 {
									// calculate where the enemy will be along the path
									var leadPosition = ds_list_find_value(targets, i).path_position + (ds_list_find_value(targets, i).pathSpeed * lifetime / path_get_length(ds_list_find_value(targets, i).path_index))
								
									// initializing for drawing a new projectile at the future position of the last enemy hit
									array_push(finalPositions, [path_get_x(ds_list_find_value(targets, i).path_index, leadPosition), path_get_y(ds_list_find_value(targets, i).path_index, leadPosition)])
									array_push(drawPercents, 0)
								}
							}
						}
						else if (type < 3) {
							for (var i = 0; i < min(ds_list_size(targets), pierce); i++) {
								// iterates through the amount of enemies tower is allowed to hit
								ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), detections, damage)
								if ds_list_find_value(targets, i).hp <= 0 {
									// kill dead enemies
									instance_destroy(ds_list_find_value(targets, i))
								}
							}
						
							array_push(finalPositions, [xpos, ypos])
							array_push(drawPercents, 0)
						}
						if (type == 3) {
							var leadPosition = target.path_position + ((point_distance(x, y, target.x, target.y) / projSpeed) * target.pathSpeed / path_get_length(target.path_index))
					
							instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																							speed : projSpeed,
																							aoe : aoe,
																							special : special,
																							spread : spread,
																							effect : effect,
																							pierce : pierce,
																							lifetime : lifetime,
																							detections : detections,
																							direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
						}
						
						// system for fractions of frames (ask turtle)
						firing = true
						attackRemainder += ceil(fireSpeed / firerateBuff / global.fastForward) - (fireSpeed / firerateBuff / global.fastForward) 
						alarm[0] = ceil(fireSpeed / firerateBuff / global.fastForward) - floor(attackRemainder)
						if attackRemainder > 1 {
							attackRemainder -= 1
						}
					}
				}
			}
			else {
				// performs buffs for all towers in range of cheerleader
				var towers = ds_list_create()
				collision_circle_list(x, y, range, tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
				for (var i = 0; i < ds_list_size(towers); i++) {
					if (ds_list_find_value(towers, i).firerateBuff < fireSpeed and not ds_list_find_value(towers, i).placing) {
						ds_list_find_value(towers, i).firerateBuff = fireSpeed
						ds_list_find_value(towers, i).image_blend = c_green
					}
				}
			}
		}
		else {
			// if off cooldown
			if (not firing) {
				var targets = ds_list_create()
				collision_line_list(0, y, room_width, y, tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
				
				for (var i = 0; i < min(ds_list_size(targets), pierce); i++) {
					ds_list_find_value(targets, i).hp -= damage
					if ds_list_find_value(targets, i).hp <= 0 {
						// kill dead enemies
						instance_destroy(ds_list_find_value(targets, i))
					}
				}
				
				firing = true
				attackRemainder += ceil(fireSpeed / firerateBuff / global.fastForward) - (fireSpeed / firerateBuff / global.fastForward) 
				alarm[0] = ceil(fireSpeed / firerateBuff / global.fastForward) - floor(attackRemainder)
				if attackRemainder > 1 {
					attackRemainder -= 1
				}
			}
		}
	}
	// adds money at the end of each wave for each money tower
	else if (enemySpawner_obj.endWave and enemySpawner_obj.enemies == 0) {
		global.money += damage
	}
	
	// upgrade menu code
	if (selected) {
		if (mouse_check_button_pressed(mb_left)) {
			// switching targeting
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 496, room_width - (208 - (string_length(targeting) - 5) * 36), 576)) {
				// gets index of the targeting function in conditions
				var place = array_get_index(conditions, targetingTranslations[array_get_index(targetingTypes, targeting)])
				// increases targeting type by 1
				if (array_get_index(targetingTypes, targeting) > array_length(targetingTypes) - 2) {
					targeting = targetingTypes[0]
				}
				else {
					targeting = targetingTypes[array_get_index(targetingTypes, targeting) + 1]
				}
				
				// replaces targeting function with new targeting function
				conditions[place] = targetingTranslations[array_get_index(targetingTypes, targeting)]
			}
			// selling
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 222, 944, room_width - 32, 1040)) {
				// gives 70% of money back, then closes the upgrade menu
				global.money += floor(cost * 0.7)
				selected = false
				global.upgradeMenu = false
				instance_destroy()
			}
		}
	}
	
	if (array_length(drawPercents) > 0) {
		for (var i = 0; i < array_length(drawPercents); i++) {
			drawPercents[i] += 1 / lifetime
			
			if (drawPercents[i] >= 1) {
				array_delete(drawPercents, i, 1)
				array_delete(finalPositions, i, 1)
			}
		}
	}
}