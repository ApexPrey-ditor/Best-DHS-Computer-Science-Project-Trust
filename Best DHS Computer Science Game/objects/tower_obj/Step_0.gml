if (not global.paused) {
	if (not placing) {
		if (array_length(drawPercents) > 0) {
			for (var i = 0; i < array_length(drawPercents); i++) {
				drawPercents[i] += 1 / (lifetime / global.fastForward)
			
				if (drawPercents[i] > 1) {
					array_delete(drawPercents, i, 1)
					array_delete(finalPositions, i, 1)
				}
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) {
			if (targetingSelection) {
				var target = instance_position(mouse_x, mouse_y, tag_get_asset_ids("Tower", asset_object))
				
				if (target != noone) {
					if (target != id and target.buffs[4] == 1 and ds_list_find_index(targetable, target) != -1) {
						if (instance_exists(buffing)) {
							buffing.buffs[4] = 1
							buffing.image_blend = c_white
						}
						
						buffing = target
						target.buffs[4] = effect[0]
						target.image_blend = c_blue
					}
				}
				
				targetingSelection = false
				selected = false
				if (not position_meeting(mouse_x, mouse_y, tag_get_asset_ids("Tower", asset_object))) {
					global.upgradeMenu = selected
				}
			}
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
		if (mouse_check_button_pressed(mb_left) and bbox_right < room_width - 384 and bbox_left > 0 and bbox_top > 0 and bbox_bottom < room_height and not place_meeting(x, y, track_obj) and not place_meeting(x, y, tower_obj)) {
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
			if (string_char_at(special, 0) != "s") {
				// specials for towers that also attack
				if (special = "rapper") {
					if (enemySpawner_obj.endWave and enemySpawner_obj.enemies == 0) {
						global.money += effect[0] * multis[3]
					}
				}
				
				if (not firing) {
					// finds targets
					var options = ds_list_create()
					var unsorted = ds_list_create()
					collision_circle_list(x, y, range * buffs[2] * multis[2], tag_get_asset_ids("Enemy", asset_object), false, true, unsorted, false)
				
					// removes all the enemies that are ghost dead, or cant be detected
					unsorted = remove_undetectable(unsorted, [max(detections[0], buffs[3]), detections[1], detections[2]])
				
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
							xpos += dcos(point_direction(x, y, target.x, target.y)) * range * buffs[2] * multis[2]
							ypos -= dsin(point_direction(x, y, target.x, target.y)) * range * buffs[2] * multis[2]
						}
						
						// gets every enemy in the collision line
						collision_line_list(x, y, xpos, ypos, tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
					
						// removes all the enemies that are ghost dead, or cant be detected
						targets = remove_undetectable(targets, [max(detections[0], buffs[3]), detections[1], detections[2]])
					
						if (type == 0) {
							for (var i = 0; i < min(ds_list_size(targets), pierce); i++) {
								// iterates through the amount of enemies tower is allowed to hit
								ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0])
								if (burn) {
									ds_list_find_value(targets, i).burning = (calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
									ds_list_find_value(targets, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
									ds_list_find_value(targets, i).image_blend = c_orange
								}
								if (stun > 0 and ds_list_find_value(targets, i).hp > 0) {
									ds_list_find_value(targets, i).speedMulti = 0
									ds_list_find_value(targets, i).alarm[2] = floor(calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0] / ds_list_find_value(targets, i).cash) * stun * 60 / global.fastForward)
								}
								if (ds_list_find_value(targets, i).hp <= 0) {
									// dead enemies are set to ghosts
									ds_list_find_value(targets, i).deactivated = true
									ds_list_find_value(targets, i).alarm[11] = ceil(lifetime / global.fastForward)
								}
							
								if (i == min(ds_list_size(targets), pierce) - 1) {
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
								ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0])
								if (burn) {
									ds_list_find_value(targets, i).burning = (calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
									ds_list_find_value(targets, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
									ds_list_find_value(targets, i).image_blend = c_orange
								}
								if (stun > 0 and ds_list_find_value(targets, i).hp > 0) {
									ds_list_find_value(targets, i).speedMulti = 0
									ds_list_find_value(targets, i).alarm[2] = floor(calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0] / ds_list_find_value(targets, i).cash) * stun * 60 / global.fastForward)
								}
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
							
							if (special == "debt collector") {
								repeat(effect[3]) {
									instance_create_depth(x, y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																								speed : projSpeed,
																								aoe : aoe,
																								special : special,
																								spread : spread,
																								effect : effect,
																								pierce : pierce,
																								lifetime : (range * buffs[2] * multis[2]) / projSpeed,
																								detections : [max(detections[0], buffs[3]), detections[1], detections[2]],
																								creator : id,
																								direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
								}
							}
							else if (special = "flame") {
								instance_create_depth(x, y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																								speed : projSpeed,
																								aoe : aoe,
																								special : special,
																								spread : spread,
																								effect : [effect[0] * buffs[1] * buffs[4] * multis[0], effect[1]],
																								pierce : pierce,
																								lifetime : lifetime,
																								detections : [max(detections[0], buffs[3]), detections[1], detections[2]],
																								direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
							}
							else {
								instance_create_depth(x, y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																								speed : projSpeed,
																								aoe : aoe,
																								special : special,
																								spread : spread,
																								effect : effect,
																								pierce : pierce,
																								lifetime : lifetime,
																								detections : [max(detections[0], buffs[3]), detections[1], detections[2]],
																								direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
							}
						}
						
						// system for fractions of frames (ask turtle)
						firing = true
						attackRemainder += ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - (fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward)
						alarm[0] = ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - floor(attackRemainder)
						if attackRemainder > 1 {
							attackRemainder -= 1
						}
					}
				}
			}
			else {
				if (special == "s firerate") {
					// performs buffs for all towers in range of cheerleader
					var towers = ds_list_create()
					collision_circle_list(x, y, range * buffs[2] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
					for (var i = 0; i < ds_list_size(towers); i++) {
						if (ds_list_find_value(towers, i).buffs[0] < effect[0] * multis[3] and not ds_list_find_value(towers, i).placing) {
							ds_list_find_value(towers, i).buffs[0] = effect[0] * multis[3]
							ds_list_find_value(towers, i).image_blend = c_green
						}
					}
				}
				if (special == "s spotter") {
					// performs buffs for all towers in range of spotter
					var towers = ds_list_create()
					var buffed = false
					collision_circle_list(x, y, range * buffs[2] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
					for (var i = 0; i < ds_list_size(towers); i++) {
						buffed = false
						if (ds_list_find_value(towers, i).buffs[1] < effect[0] * multis[3] and not ds_list_find_value(towers, i).placing) {
							ds_list_find_value(towers, i).buffs[1] = effect[0] * multis[3]
							buffed = true
						}
						if (ds_list_find_value(towers, i).buffs[2] < effect[1] * multis[3] and not ds_list_find_value(towers, i).placing) {
							ds_list_find_value(towers, i).buffs[2] = effect[1] * multis[3]
							buffed = true
						}
						if (ds_list_find_value(towers, i).buffs[3] == false and not ds_list_find_value(towers, i).placing) {
							ds_list_find_value(towers, i).buffs[3] = true
							buffed = true
						}
						if (buffed) {
							ds_list_find_value(towers, i).image_blend = c_purple
						}
					}
				}
				if (special == "s commander") {
					// performs buffs for all towers in range of commander
					var towers = ds_list_create()
					collision_circle_list(x, y, range * buffs[2] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
					for (var i = 0; i < ds_list_size(towers); i++) {
						if (ds_list_find_value(towers, i).buffs[5] < effect[0] * multis[3] and not ds_list_find_value(towers, i).placing) {
							ds_list_find_value(towers, i).buffs[5] = effect[0] * multis[3]
							ds_list_find_value(towers, i).image_blend = c_maroon
						}
					}
					
					// for commander attacking
					if (enemySpawner_obj.enemies > 0 and not firing) {
						var targets = ds_list_create()
						for (var i = 0; i < instance_number(enemy_obj); ++i) {
							ds_list_add(targets, instance_find(enemy_obj, i))
						}
					
						var minTarget = noone
						var maxTarget = noone
					
						if (targeting == "Single Target") {
							var highscore = -infinity
							var position = 0
	
							for (var i = 0; i < ds_list_size(targets); i++) {
								if ds_list_find_value(targets, i).hp > highscore {
									highscore = ds_list_find_value(targets, i).hp
									position = i
								}
							}
						
							minTarget = ds_list_find_value(targets, position)
							maxTarget = ds_list_find_value(targets, position)
						}
						else {
							minTarget = ds_list_find_value(targets, min_array_but_specificaly_for_finding_paths(targets))
							maxTarget = ds_list_find_value(targets, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(targets))
						}
					
						var realMinPos = minTarget.path_position + (lifetime * 2 * minTarget.pathSpeed / path_get_length(minTarget.path_index))
						var increment = (maxTarget.path_position + (lifetime * maxTarget.pathSpeed / path_get_length(maxTarget.path_index)) - realMinPos) / 5
					
						for (var i = 0; i < 6; i++) {
							instance_create_depth(path_get_x(minTarget.path_index, realMinPos + i * increment), path_get_y(minTarget.path_index, realMinPos + i * increment), 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																								speed : projSpeed,
																								effect : [(5 - i) * lifetime / 6 + 1],
																								aoe : aoe,
																								special : special,
																								pierce : pierce,
																								lifetime : lifetime,
																								type : type,
																								detections : [max(detections[0], buffs[3]), detections[1], detections[2]],})
						}
					
						firing = true
						attackRemainder += ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - (fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) 
						alarm[0] = ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - floor(attackRemainder)
						if attackRemainder > 1 {
							attackRemainder -= 1
						}
					}
				}
				if (special == "s hacker") {
					// performs buffs for all towers in range of hacker
					var towers = ds_list_create()
					collision_circle_list(x, y, range * buffs[2] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
					for (var i = 0; i < ds_list_size(towers); i++) {
						if (ds_list_find_value(towers, i).buffs[6] < effect[0] * multis[3] and not ds_list_find_value(towers, i).placing) {
							ds_list_find_value(towers, i).buffs[6] = effect[0] * multis[3]
							ds_list_find_value(towers, i).image_blend = c_aqua
						}
					}
					
					if (not firing) {
						// finds targets
						var options = ds_list_create()
						var unsorted = ds_list_create()
						collision_circle_list(x, y, range * buffs[2] * multis[2], tag_get_asset_ids("Enemy", asset_object), false, true, unsorted, false)
				
						// removes all the enemies that are ghost dead, or cant be detected
						unsorted = remove_undetectable(unsorted, [max(detections[0], buffs[3]), detections[1], detections[2]])
				
						// sorts enemies by furthest along path
						repeat (ds_list_size(unsorted)) {
							ds_list_add(options, ds_list_find_value(unsorted, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(unsorted)))
							ds_list_delete(unsorted, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(unsorted))
						}

						if (ds_list_size(options) > 0) {
							follows = []
							
							// initializes variables needed for targeting
							var chosen = 0
							var currentScore = 0
							var highscore = 0
				
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
							
							array_push(follows, ds_list_find_value(options, chosen))
							
							chosen = 0
							currentScore = 0
							highscore = 0
				
							// conditions is an array of functions that are used to generate targeting score
							// iterates through every targeting function and adds the output to highscore
							// this gives the first value the starting highscore
							for (var i = 0; i < array_length(conditions2); i++) {
								highscore += conditions2[i](options, ds_list_size(options) - 1, chosen, i)
							}
				
							// iterates through every enemy in range
							for (var i = 0; i < ds_list_size(options); i++) {
								// adds the score of the targeting functions to currentScore
								currentScore = 0
								for (var w = 0; w < array_length(conditions2); w++) {
									currentScore += conditions2[w](options, chosen, i, w)
								}
					
								// if beats highscore then this becomes the new target
								if (currentScore >= highscore) {
									//show_debug_message(string())
									highscore = currentScore
									chosen = i
								}
							}
				
							// gets instance id of the "winner" (they are going to die)
							array_push(follows, ds_list_find_value(options, chosen))
							
							for (var i = 0; i < array_length(follows); i++) {
								follows[i].hp -= calculate_type_damage(follows[i], [max(detections[0], buffs[3]), detections[1], detections[2]], damage * buffs[1] * buffs[4] * multis[0])
								if follows[i].hp <= 0 {
									// dead enemies are set to ghosts
									follows[i].deactivated = true
									follows[i].alarm[11] = ceil(3 / global.fastForward)
								}
							}
							
							firing = true
							attackRemainder += ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - (fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) 
							alarm[0] = ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - floor(attackRemainder)
							if attackRemainder > 1 {
								attackRemainder -= 1
							}
						}
					}
				}
			}
		}
		else {
			// if off cooldown
			if (not firing) {
				// for laser attacking
				var targets = ds_list_create()
				collision_line_list(0, y, room_width, y, tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
				
				for (var i = 0; i < min(ds_list_size(targets), pierce); i++) {
					ds_list_find_value(targets, i).hp -= damage * buffs[1] * buffs[4] * multis[0]
					if ds_list_find_value(targets, i).hp <= 0 {
						// kill dead enemies
						instance_destroy(ds_list_find_value(targets, i))
					}
				}
				
				firing = true
				attackRemainder += ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - (fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) 
				alarm[0] = ceil(fireSpeed / buffs[0] / buffs[5] / multis[1] / global.fastForward) - floor(attackRemainder)
				if attackRemainder > 1 {
					attackRemainder -= 1
				}
			}
		}
	}
	// adds money at the end of each wave for each money tower
	else if (enemySpawner_obj.endWave and enemySpawner_obj.enemies == 0) {
		global.money += effect[0] * multis[3]
	}
	
	// debt collector leveling up
	if (special == "debt collector" and level < 4) {
		if (kills >= effect[level - 1]) {
			level += 1
			
			switch (level) {
				case 2:
					damage = 5
					pierce = 2
					fireSpeed = 45
					range = 300
					detections = [true, false, false]
					effect[3] = 4
					effect[4] = 1.25
					break;
				case 3:
					damage = 10
					fireSpeed = 36
					range = 450
					pierce = 3
					detections = [true, true, false]
					effect[3] = 6
					effect[4] = 1.5
					break;
				case 4:
					damage = 20
					fireSpeed = 27
					range = 650
					pierce = 4
					detections = [true, true, true]
					effect[3] = 8
					effect[4] = 2
					break;
			}
		}
	}
	
	// upgrade menu code
	if (selected) {
		if (mouse_check_button_pressed(mb_left)) {
			// switching targeting
			draw_set_font(jack)
			if (special != "s booster" and special != "s commander" and special != "s hacker"){
				if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 400, room_width - 336 + string_width(targeting) * 2, 480)) {
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
				if (point_in_rectangle(mouse_x, mouse_y, room_width - 80 - string_width(specialTargeting) * 1.5, 496, room_width - 48, 576)) {
					// gets index of the special function in conditions
					var place = array_get_index(conditions, specialTranslations[array_get_index(specialTypes, specialTargeting)])
					
					if (array_get_index(specialTypes, specialTargeting) > array_length(specialTypes) - 2) {
						specialTargeting = specialTypes[0]
					}
					else {
						specialTargeting = specialTypes[array_get_index(specialTypes, specialTargeting) + 1]
					}
				
					// replaces targeting function with new targeting function
					conditions[place] = specialTranslations[array_get_index(specialTypes, specialTargeting)]
				}	
			}
			// hacker targeting
			else if (special == "s hacker") {
				if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 400, room_width - 336 + string_width(targeting), 436)) {
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
				if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 444, room_width - 336 + string_width(targeting2), 480)) {
					// gets index of the targeting function in conditions
					var place = array_get_index(conditions2, targetingTranslations[array_get_index(targetingTypes, targeting2)])
					// increases targeting type by 1
					if (array_get_index(targetingTypes, targeting2) > array_length(targetingTypes) - 2) {
						targeting2 = targetingTypes[0]
					}
					else {
						targeting2 = targetingTypes[array_get_index(targetingTypes, targeting2) + 1]
					}
				
					// replaces targeting function with new targeting function
					conditions2[place] = targetingTranslations[array_get_index(targetingTypes, targeting2)]
				}
			}
			// booster and commander targeting
			else if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 400, room_width - 48, 576)) {
				if (special == "s booster") {
					targetingSelection = true
					collision_circle_list(x, y, range * buffs[2] * multis[2], tower_obj, false, true, targetable, false)
				}
				if (special == "s commander") {
					if (targeting == "Carpet Bombing") {
						targeting = "Single Target"
					}
					else {
						targeting = "Carpet Bombing"
					}
				}
			}
			// upgrading
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 592, room_width - 48, 896) and special != "debt collector" and global.money >= ceil(costs[towerType][upgrade] * (1 - buffs[6])) and array_length(global.upgrades[towerType]) > upgrade) {
				global.money -= ceil(costs[towerType][upgrade] * (1 - buffs[6]))
				cost += ceil(costs[towerType][upgrade] * (1 - buffs[6]))
				
				for (var i = 0; i < struct_names_count(global.upgrades[towerType][upgrade]); i++) {
					switch (struct_get_names(global.upgrades[towerType][upgrade])[i]) {
						case "damage":
							if (global.upgrades[towerType][upgrade].damage > 0) {
								multis[0] += global.upgrades[towerType][upgrade].damage * effectiveness[upgrade]
							}
							else {
								multis[0] = multis[0] / abs(global.upgrades[towerType][upgrade].damage * effectiveness[upgrade] - 1)
							}
							break;
						case "fireSpeed":
							if (global.upgrades[towerType][upgrade].fireSpeed > 0) {
								multis[1] += global.upgrades[towerType][upgrade].fireSpeed * effectiveness[upgrade]
							}
							else {
								multis[1] = multis[1] / abs(global.upgrades[towerType][upgrade].fireSpeed * effectiveness[upgrade] - 1)
							}
							break;
						case "range":
							if (global.upgrades[towerType][upgrade].range > 0) {
								multis[2] += global.upgrades[towerType][upgrade].range * effectiveness[upgrade]
							}
							else {
								multis[2] = multis[2] / abs(global.upgrades[towerType][upgrade].range * effectiveness[upgrade] - 1)
							}
							break;
						case "d0":
							detections[0] = true
							break;
						case "d1":
							detections[1] = true
							break;
						case "buff":
							if (global.upgrades[towerType][upgrade].range > 0) {
								multis[3] += global.upgrades[towerType][upgrade].buff * effectiveness[upgrade]
							}
							else {
								multis[3] = multis[3] / abs(global.upgrades[towerType][upgrade].buff * effectiveness[upgrade] - 1)
							}
							break;
						case "d2":
							detections[2] = true
							break;
						case "pierceL":
							pierce += ceil(global.upgrades[towerType][upgrade].pierceL * effectiveness[upgrade])
							break;
						case "burn":
							burn = true
							break;
						case "stun":
							stun += global.upgrades[towerType][upgrade].stun * effectiveness[upgrade]
							break;
						case "bounce":
							bounce += global.upgrades[towerType][upgrade].bounce * effectiveness[upgrade]
							break;
					}
				}
				
				upgrade += 1
			}
			// selling
			if (point_in_rectangle(mouse_x, mouse_y, room_width - 222, 944, room_width - 32, 1040)) {
				// gives 60% of money back, then closes the upgrade menu
				global.money += floor(cost * 0.6)
				selected = false
				global.upgradeMenu = false
				
				if (string_char_at(special, 0) == "s") {
					with (tower_obj) {
						buffs = [1, 1, 1, false, 1, 1, 1]
						image_blend = c_white
					}
				}
				
				instance_destroy()
			}
		}
	}
}

depth = -y