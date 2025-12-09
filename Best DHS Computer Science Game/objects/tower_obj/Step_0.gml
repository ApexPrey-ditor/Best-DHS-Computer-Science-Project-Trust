if (not global.paused) {
	if (not placing) {
		if (array_length(drawPercents) > 0) {
			for (var i = 0; i < array_length(drawPercents); i++) {
				drawPercents[i] += 1 / (lifetime / global.fastForward)
			
				if (drawPercents[i] > 1) {
					if (array_length(bulletBounces) > i) {
						bulletBounces[i] -= 1
						
						var target = noone
						var highscore = infinity
						
						for (var w = 0; w < instance_number(enemy_obj); w++) {
							if (point_distance(finalPositions[i][0], finalPositions[i][1], instance_find(enemy_obj, w).x, instance_find(enemy_obj, w).y) < highscore and check_undetectable(instance_find(enemy_obj, w), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]]) and not array_contains(bounceIgnore[i], instance_find(enemy_obj, w))) {
								highscore = point_distance(finalPositions[i][0], finalPositions[i][1], instance_find(enemy_obj, w).x, instance_find(enemy_obj, w).y)
								target = instance_find(enemy_obj, w)
							}
						}

						if (target != noone) {
							target.hp -= calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0])
							if (burn) {
								target.burning = (calculate_type_damage(target, [max(detections[0], buffs[3]), true, detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
								target.alarm[0] = ceil(fireSpeed / global.fastForward * 3)
								target.image_blend = c_orange
							}
							if (stun > 0 and calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) > 0) {
								target.speedMulti = 0
								target.image_speed = 0
								target.alarm[2] = ceil(calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / target.cash * stun * 60 / global.fastForward)
							}
							if (slow > 0 and target.speedMulti > target.speedMulti / ((calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / target.cash) * slow + 1)) {
								target.speedMulti = target.speedMulti / ((calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / target.cash) * slow + 1)
								target.alarm[2] = ceil(fireSpeed / global.fastForward * 3)
								target.image_blend = c_aqua
							}
							if (target.hp <= 0) {
								// dead enemies are set to ghosts
								target.deactivated = true
								target.alarm[11] = ceil(lifetime / global.fastForward)
							}
							
							// calculate where the enemy will be along the path
							var leadPosition = target.path_position + (target.pathSpeed * lifetime / path_get_length(target.path_index))
							
							array_push(bouncePositions, [path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition), finalPositions[i][0], finalPositions[i][1]])
							array_push(bouncePercents, 0)
							array_push(bounceIgnore[i], target)
							
							
							if (bulletBounces[i] <= 0) {
								array_delete(bulletBounces, i, 1)
								array_delete(bounceIgnore, i, 1)
							}
						}
						else {
							array_delete(bulletBounces, i, 1)
							array_delete(bounceIgnore, i, 1)
						}
					}
					array_delete(drawPercents, i, 1)
					array_delete(finalPositions, i, 1)
				}
			}
		}
		if (array_length(bouncePercents) > 0) {
			for (var i = 0; i < array_length(bouncePercents); i++) {
				bouncePercents[i] += 1 / (lifetime / global.fastForward)
			
				if (bouncePercents[i] > 1) {
					if (array_length(bulletBounces) > i) {
						bulletBounces[i] -= 1
						
						var target = noone
						var highscore = infinity
						
						for (var w = 0; w < instance_number(enemy_obj); w++) {
							if (point_distance(bouncePositions[i][0], bouncePositions[i][1], instance_find(enemy_obj, w).x, instance_find(enemy_obj, w).y) < highscore and check_undetectable(instance_find(enemy_obj, w), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]]) and not array_contains(bounceIgnore[i], instance_find(enemy_obj, w))) {
								highscore = point_distance(bouncePositions[i][0], bouncePositions[i][1], instance_find(enemy_obj, w).x, instance_find(enemy_obj, w).y)
								target = instance_find(enemy_obj, w)
							}
						}

						if (target != noone) {
							target.hp -= calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0])
							if (burn) {
								target.burning = (calculate_type_damage(target, [max(detections[0], buffs[3]), true, detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
								target.alarm[0] = ceil(fireSpeed / global.fastForward * 3)
								target.image_blend = c_orange
							}
							if (stun > 0 and calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) > 0) {
								target.speedMulti = 0
								target.image_speed = 0
								target.alarm[2] = ceil(calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / target.cash * stun * 60 / global.fastForward)
							}
							if (slow > 0 and target.speedMulti > target.speedMulti / ((calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / target.cash) * slow + 1)) {
								target.speedMulti = target.speedMulti / ((calculate_type_damage(target, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / target.cash) * slow + 1)
								target.alarm[2] = ceil(fireSpeed / global.fastForward * 3)
								target.image_blend = c_aqua
							}
							if (target.hp <= 0) {
								// dead enemies are set to ghosts
								target.deactivated = true
								target.alarm[11] = ceil(lifetime / global.fastForward)
							}
							
							// calculate where the enemy will be along the path
							var leadPosition = target.path_position + (target.pathSpeed * lifetime / path_get_length(target.path_index))
							
							array_push(bouncePositions, [path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition), bouncePositions[i][0], bouncePositions[i][1]])
							array_push(bouncePercents, 0)
							array_push(bounceIgnore[i], target)
							
							
							if (bulletBounces[i] <= 0) {
								array_delete(bulletBounces, i, 1)
								array_delete(bounceIgnore, i, 1)
							}
						}
						else {
							array_delete(bulletBounces, i, 1)
							array_delete(bounceIgnore, i, 1)
						}
					}
					
					array_delete(bouncePercents, i, 1)
					array_delete(bouncePositions, i, 1)
				}
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) {
			if (targetingSelection) {
				var target = instance_position(mouse_x, mouse_y, tag_get_asset_ids("Tower", asset_object))
				
				if (target != noone) {
					if (target != id and target.buffs[4] == 1 and ds_list_find_index(targetable, target) != -1) {
						if (array_length(buffing) > 0) {
							if (instance_exists(buffing[0])) {
								buffing[0].buffs[4] = 1
								buffing[0].buffs[10] = 1
								buffing[0].buffs[11] = 1
								buffing[0].buffs[12] = 1
								buffing[0].buffs[15] = 0
								buffing[0].image_blend = c_white
							}
						}
						
						buffing = [target]
						var towers = ds_list_create()
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
						target.buffs[4] = (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, target) * 0.5 * psychiatrist + 1)
						target.buffs[15] = (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, target) * 0.5 * psychiatrist + 1)
						if (tier4) {
							target.buffs[10] = (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, target) * 0.5 * psychiatrist + 1)
							target.buffs[11] = (effect[2] - (ds_list_size(towers) * (effect[2] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[2] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, target) * 0.5 * psychiatrist + 1)
							target.buffs[12] = (effect[3] - (ds_list_size(towers) * (effect[3] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[3] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, target) * 0.5 * psychiatrist + 1)
						}
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
			if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) and not settingInit_obj.placing) {
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
		
		// checks if the tower isnt the money making tower
		else if (special != "money") {
			if (range > 50) {
				if (string_char_at(special, 0) != "s") {
					// specials for towers that also attack
					if (special = "rapper") {
						if (enemySpawner_obj.waveCash) {
							global.money += effect[0] * multis[3]
						}
					}
				
					if (not firing) {
						// finds targets
						var options = ds_list_create()
						var unsorted = ds_list_create()
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Enemy", asset_object), false, true, unsorted, false)
				
						// removes all the enemies that are ghost dead, or cant be detected
						unsorted = remove_undetectable(unsorted, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]])
				
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
							
							// for dissapator
							if (towerType == 3 and tier4) {
								if (target.x < x) {
									image_xscale = abs(image_xscale)
								}
								else {
									image_xscale = -abs(image_xscale)
								}
								instance_create_depth(target.x, target.y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																									aoe : aoe * multis[4],
																									slow : slow,
																									stun : stun,
																									burn : burn,
																									fireSpeed : fireSpeed,
																									pierce : pierce * multis[5] + buffs[11],
																									lifetime : lifetime,
																									detections : [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]]})
							}
							else {
								var targets = ds_list_create()
						
								// extends the collision line to the edge of the screen
								var xpos = x
								var ypos = y
					
								if (type != 2) {
									while (abs(xpos) < room_width and abs(ypos) < room_height) {
										if (target.x - x != 0) {
											if (abs(target.x - x) > abs(target.y - y)) {
												xpos += (target.x - x) * (1920 / abs(target.x - x))
											}
											else {
												xpos += (target.x - x) * (1920 / abs(target.y - y))
											}
										}
										if (target.y - y != 0) {
											if (abs(target.x - x) > abs(target.y - y)) {
												ypos += (target.y - y) * (1920 / abs(target.x - x))
											}
											else {
												ypos += (target.y - y) * (1920 / abs(target.y - y))
											}
										}
										if (xpos == x and ypos == x) {
											xpos = room_width
										}
									}
								
									// gets every enemy in the collision line
									collision_line_list(x, y, xpos, ypos, tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
								}
								else {
									xpos += dcos(point_direction(x, y, target.x, target.y)) * range * buffs[2] * buffs[12] * multis[2]
									ypos -= dsin(point_direction(x, y, target.x, target.y)) * range * buffs[2] * buffs[12] * multis[2]
								
									collision_line_list(x + dcos(point_direction(x, y, target.x, target.y)) * aoe * multis[4], y, xpos + dcos(point_direction(x, y, target.x, target.y)) * aoe * multis[4], ypos, tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
									collision_line_list(x, y - dsin(point_direction(x, y, target.x, target.y)) * aoe * multis[4], xpos, ypos - dsin(point_direction(x, y, target.x, target.y)) * aoe * multis[4], tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
							
									var translate = ds_list_create()
									ds_list_copy(translate, targets)
								
									for (var i = 0; i < ds_list_size(targets); i++) {
										ds_list_delete(translate, i)
										if (ds_list_find_index(translate, ds_list_find_value(targets, i)) != -1) {
											ds_list_delete(targets, ds_list_find_index(translate, ds_list_find_value(targets, i)))
										}
										ds_list_copy(translate, targets)
									}
								}
					
								// removes all the enemies that are ghost dead, or cant be detected
								targets = remove_undetectable(targets, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]])
					
								if (type == 0) {
									for (var i = 0; i < min(ds_list_size(targets), pierce * multis[5] + buffs[11]); i++) {
										if (i == 0 and towerType == 1 and tier4) {
											if (ds_list_find_value(targets, i) == prevHit and buffs[7] < 4) {
												buffs[7] += 0.2
											}
											else {
												prevHit = ds_list_find_value(targets, i)
												buffs[7] = 1
											}
										
											// iterates through the amount of enemies tower is allowed to hit
											ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0] * buffs[7])
											if (burn) {
												ds_list_find_value(targets, i).burning = (calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), true, detections[2]], damage * buffs[1] * buffs[4] * multis[0] * buffs[7]) / fireSpeed / 2)
												ds_list_find_value(targets, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
												ds_list_find_value(targets, i).image_blend = c_orange
											}
											if (stun > 0 and calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0] * buffs[7]) > 0) {
												ds_list_find_value(targets, i).speedMulti = 0
												ds_list_find_value(targets, i).image_speed = 0
												ds_list_find_value(targets, i).alarm[2] = ceil(calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0] * buffs[7]) / ds_list_find_value(targets, i).cash * stun * 60 / global.fastForward)
											}
											if (slow > 0 and ds_list_find_value(targets, i).speedMulti > ds_list_find_value(targets, i).speedMulti / ((calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0] * buffs[7]) / ds_list_find_value(targets, i).cash) * slow + 1)) {
												ds_list_find_value(targets, i).speedMulti = ds_list_find_value(targets, i).speedMulti / ((calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0] * buffs[7]) / ds_list_find_value(targets, i).cash) * slow + 1)
												ds_list_find_value(targets, i).alarm[2] = ceil(fireSpeed / global.fastForward * 3)
												ds_list_find_value(targets, i).image_blend = c_aqua
											}
										}
										else {
											// iterates through the amount of enemies tower is allowed to hit
											ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0])
											if (burn) {
												ds_list_find_value(targets, i).burning = (calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), true, detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
												ds_list_find_value(targets, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
												ds_list_find_value(targets, i).image_blend = c_orange
											}
											if (stun > 0 and calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) > 0) {
												ds_list_find_value(targets, i).speedMulti = 0
												ds_list_find_value(targets, i).image_speed = 0
												ds_list_find_value(targets, i).alarm[2] = ceil(calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash * stun * 60 / global.fastForward)
											}
											if (slow > 0 and ds_list_find_value(targets, i).speedMulti > ds_list_find_value(targets, i).speedMulti / ((calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash) * slow + 1)) {
												ds_list_find_value(targets, i).speedMulti = ds_list_find_value(targets, i).speedMulti / ((calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash) * slow + 1)
												ds_list_find_value(targets, i).alarm[2] = ceil(fireSpeed / global.fastForward * 3)
												ds_list_find_value(targets, i).image_blend = c_aqua
											}
											if (ds_list_find_value(targets, i).hp <= 0) {
												// dead enemies are set to ghosts
												ds_list_find_value(targets, i).deactivated = true
												ds_list_find_value(targets, i).alarm[11] = ceil(lifetime / global.fastForward)
											}
										}
							
										if (i == min(ds_list_size(targets), pierce * multis[5] + buffs[11]) - 1) {
											// calculate where the enemy will be along the path
											var leadPosition = ds_list_find_value(targets, i).path_position + (ds_list_find_value(targets, i).pathSpeed * lifetime / path_get_length(ds_list_find_value(targets, i).path_index))
								
											if (path_get_x(ds_list_find_value(targets, i).path_index, leadPosition) < x) {
												image_xscale = abs(image_xscale)
											}
											else {
												image_xscale = -abs(image_xscale)
											}
								
											// initializing for drawing a new projectile at the future position of the last enemy hit
											array_push(finalPositions, [path_get_x(ds_list_find_value(targets, i).path_index, leadPosition), path_get_y(ds_list_find_value(targets, i).path_index, leadPosition)])
											array_push(drawPercents, 0)
											if (bounce > 0) {
												array_push(bulletBounces, bounce)
												array_push(bounceIgnore, [ds_list_find_value(targets, i)])
											}
										}
									}
								}
								else if (type < 3) {
									for (var i = 0; i < min(ds_list_size(targets), pierce * multis[5] + buffs[11]); i++) {
										if (delay <= 0) {
											// iterates through the amount of enemies tower is allowed to hit
											ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0])
											if (burn) {
												ds_list_find_value(targets, i).burning = (calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), true, detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
												ds_list_find_value(targets, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
												ds_list_find_value(targets, i).image_blend = c_orange
											}
											if (stun > 0 and calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) > 0) {
												ds_list_find_value(targets, i).speedMulti = 0
												ds_list_find_value(targets, i).image_speed = 0
												ds_list_find_value(targets, i).alarm[2] = ceil(calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash * stun * 60 / global.fastForward)
											}
											if (slow > 0 and ds_list_find_value(targets, i).speedMulti > ds_list_find_value(targets, i).speedMulti / ((calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash) * slow + 1)) {
												ds_list_find_value(targets, i).speedMulti = ds_list_find_value(targets, i).speedMulti / ((calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash) * slow + 1)
												ds_list_find_value(targets, i).alarm[2] = ceil(fireSpeed / global.fastForward * 3)
												ds_list_find_value(targets, i).image_blend = c_aqua
											}
											if (decamo and shotNum % 3 == 0) {
												ds_list_find_value(targets, i).class[0] = false
											}
											if (towerType == 14 and tier4 and shotNum % 10 == 0 and i == 0) {
												ds_list_find_value(targets, i).hp -= calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], 100 * buffs[1] * buffs[4] * multis[0])
											}
											if ds_list_find_value(targets, i).hp <= 0 {
												// kill dead enemies
												instance_destroy(ds_list_find_value(targets, i))
											}
										}
										else {
											array_push(ds_list_find_value(targets, i).delays, delay)
											var effectSend = [calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]), 0, 0, 1, 0, false]
										
											if (burn) {
												effectSend[1] = (calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), true, detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / fireSpeed / 2)
												effectSend[2] = ceil(fireSpeed / global.fastForward * 3)
											}
											if (stun > 0 and calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) > 0) {
												effectSend[3] = 0
												effectSend[4] = ceil(calculate_type_damage(ds_list_find_value(targets, i), [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0]) / ds_list_find_value(targets, i).cash * stun * 60 / global.fastForward)
											}
											if (decamo and shotNum % 3 == 0) {
												effectSend[5] = true
											}
										
											array_push(ds_list_find_value(targets, i).effect, effectSend)
										}
									}
						
									if (xpos < x) {
										image_xscale = abs(image_xscale)
									}
									else {
										image_xscale = -abs(image_xscale)
									}
						
									array_push(finalPositions, [xpos, ypos])
									array_push(drawPercents, 0)
									if (bounce > 0) {
										array_push(bulletBounces, bounce)
										array_push(bounceIgnore, [])
									}
								}
								if (type == 3) {
									var leadPosition = target.path_position + ((point_distance(x, y, target.x, target.y) / projSpeed) * target.pathSpeed / path_get_length(target.path_index))
									if (lead == false) {
										leadPosition = target.path_position
									}
								
									if (path_get_x(target.path_index, leadPosition) < x) {
										image_xscale = abs(image_xscale)
									}
									else {
										image_xscale = -abs(image_xscale)
									}
							
									if (special == "debt collector") {
										repeat(effect[3]) {
											instance_create_depth(x, y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																										speed : projSpeed,
																										aoe : aoe * multis[4],
																										special : special,
																										spread : spread,
																										effect : effect,
																										pierce : pierce * multis[5] + buffs[11],
																										lifetime : (range * buffs[2] * buffs[12] * multis[2]) / projSpeed,
																										detections : [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]],
																										creator : id,
																										direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
										}
									}
									else if (special = "flame") {
										instance_create_depth(x, y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																										speed : projSpeed,
																										aoe : aoe * multis[4],
																										stun : stun,
																										special : special,
																										spread : spread,
																										effect : [effect[0] * buffs[1] * buffs[4] * multis[0], effect[1]],
																										pierce : pierce * multis[5] + buffs[11],
																										lifetime : lifetime,
																										shotNum : shotNum,
																										decamo : decamo,
																										delay : delay,
																										detections : [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]],
																										direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
									}
									else {
										instance_create_depth(x, y, 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																										speed : projSpeed,
																										aoe : aoe * multis[4],
																										stun : stun,
																										burn : burn,
																										fireSpeed : fireSpeed,
																										special : special,
																										spread : spread,
																										effect : effect,
																										pierce : pierce * multis[5] + buffs[11],
																										lifetime : lifetime,
																										shotNum : shotNum,
																										decamo : decamo,
																										delay : delay,
																										detections : [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]],
																										direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
									}
								}
							}
						
							// system for fractions of frames (ask turtle)
							if (towerType == 14 and tier4) {
								if (shotNum % 10 == 0) {
									sprite_index = asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_2_spr")
								}
								else {
									sprite_index = asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_1_spr")
								}
							}
							else if (towerType != 6) {
								sprite_index = asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_spr")
							}
							else {
								if (puncherAlt == "1") {
									puncherAlt = "2"
								}
								else {
									puncherAlt = "1"
								}
								sprite_index = asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_" + puncherAlt + "_spr")
							}
							image_index = 0
							global.health -= lifeDeduct
							shotNum += 1
							firing = true
							attackRemainder += ceil((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - (fireSpeed / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward)
							if (towerType == 2 and tier4 and doubleShot > 1) {
								doubleShot -= 1
								image_speed = global.fastForward
								alarm[0] = ceil(6 / global.fastForward)
							}
							else {
								doubleShot = 10
								image_speed = global.fastForward
								alarm[0] = ceil((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - floor(attackRemainder)
							}
							if (attackRemainder > 1) {
								attackRemainder -= 1
							}
						}
					}
				}
				else if (bind == 0 or global.wave % (bind * 4) == 0) {
					if (special == "s firerate") {
						// performs buffs for all towers in range of cheerleader
						var towers = ds_list_create()
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
						for (var i = 0; i < ds_list_size(towers); i++) {
							if (not addiction) {
								if (ds_list_find_value(towers, i).buffs[0] < (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) and not ds_list_find_value(towers, i).placing) {
									ds_list_find_value(towers, i).buffs[0] = (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1)
									ds_list_find_value(towers, i).image_blend = c_green
								}
								if (ds_list_find_value(towers, i).buffs[13] < (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) and not ds_list_find_value(towers, i).placing) {
									ds_list_find_value(towers, i).buffs[13] = (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1)
									ds_list_find_value(towers, i).image_blend = c_green
								}
								if (tier4) {
									if (ds_list_find_value(towers, i).buffs[8] < (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) and not ds_list_find_value(towers, i).placing) {
										ds_list_find_value(towers, i).buffs[8] = (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1)
										ds_list_find_value(towers, i).image_blend = c_green
									}
								}
							}
							else {
								if (not array_contains(buffing, ds_list_find_value(towers, i)) and not ds_list_find_value(towers, i).placing) {
									if (countdown > 0) {
										ds_list_find_value(towers, i).buffs[0] += ((effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) - 1)
										ds_list_find_value(towers, i).buffs[13] += ((childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1))
										if (tier4) {
											ds_list_find_value(towers, i).buffs[8] += ((effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) - 1)
										}
										ds_list_find_value(towers, i).image_blend = c_green
									
										array_push(buffing, ds_list_find_value(towers, i))
									}
									else {
										ds_list_find_value(towers, i).buffs[0] = ds_list_find_value(towers, i).buffs[0] / ((effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1))
										ds_list_find_value(towers, i).buffs[13] -= ((childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1))
										if (tier4) {
											ds_list_find_value(towers, i).buffs[8] = ds_list_find_value(towers, i).buffs[8] / ((effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1))
										}
										ds_list_find_value(towers, i).image_blend = c_green
									
										array_push(buffing, ds_list_find_value(towers, i))
									}
								}
							}
						}
					}
					if (special == "s spotter") {
						// performs buffs for all towers in range of spotter
						var towers = ds_list_create()
						var buffed = false
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
						
						for (var j = 0; j < ds_list_size(towers); j++) {
							if (not addiction) {
								buffed = false
								if (ds_list_find_value(towers, j).buffs[1] < (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1) and not ds_list_find_value(towers, j).placing) {
									ds_list_find_value(towers, j).buffs[1] = (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1)
									buffed = true
								}
								if (ds_list_find_value(towers, j).buffs[2] < (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1) and not ds_list_find_value(towers, j).placing) {
									ds_list_find_value(towers, j).buffs[2] = (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1)
									buffed = true
								}
								if (ds_list_find_value(towers, j).buffs[3] == false and not ds_list_find_value(towers, j).placing) {
									ds_list_find_value(towers, j).buffs[3] = true
									buffed = true
								}
								if (ds_list_find_value(towers, j).buffs[9] == false and not ds_list_find_value(towers, j).placing and tier4) {
									ds_list_find_value(towers, j).buffs[9] = true
									buffed = true
								}
								if (ds_list_find_value(towers, j).buffs[14] < (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1) and not ds_list_find_value(towers, j).placing) {
									ds_list_find_value(towers, j).buffs[14] = (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1)
									buffed = true
								}
								if (buffed and not ds_list_find_value(towers, j).placing) {
									ds_list_find_value(towers, j).image_blend = c_purple
								}
							}
							else {
								if (not array_contains(buffing, ds_list_find_value(towers, j)) and not ds_list_find_value(towers, j).placing) {
									if (countdown > 0) {
										ds_list_find_value(towers, j).buffs[1] += ((effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1) - 1)
										ds_list_find_value(towers, j).buffs[2] += ((effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1) - 1)
										ds_list_find_value(towers, j).buffs[14] += ((childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1))
										ds_list_find_value(towers, j).buffs[3] = true
										if (tier4) {
											ds_list_find_value(towers, j).buffs[9] = true
										}
									}
									else {
										ds_list_find_value(towers, j).buffs[1] = ds_list_find_value(towers, j).buffs[1] / ((effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1))
										ds_list_find_value(towers, j).buffs[2] = ds_list_find_value(towers, j).buffs[2] / ((effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1))
										ds_list_find_value(towers, j).buffs[14] -= ((childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, ds_list_find_value(towers, j)) * 0.5 * psychiatrist + 1))
									}
								}
							}
						}
						
						if (tier4) {
							if (instance_exists(marked)) {
								if (distance_to_object(marked) > range * buffs[2] * buffs[12] * multis[2]) {
									marked.weakness = 1
									marked = noone
								}
							}
							if (not instance_exists(marked)) {
								// finds targets
								var options = ds_list_create()
								var unsorted = ds_list_create()
								collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Enemy", asset_object), false, true, unsorted, false)
				
								// removes all the enemies that are ghost dead, or cant be detected
								unsorted = remove_undetectable(unsorted, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]])
				
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
									marked = ds_list_find_value(options, chosen)
									marked.weakness = 1.5
								}
							}
						}
					}
					if (special == "s commander") {
						// performs buffs for all towers in range of commander
						var towers = ds_list_create()
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
						for (var i = 0; i < ds_list_size(towers); i++) {
							if (ds_list_find_value(towers, i).buffs[5] < (effect[0] * buffs[8] * multis[3] * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) and not ds_list_find_value(towers, i).placing) {
								ds_list_find_value(towers, i).buffs[5] = (effect[0] * buffs[8] * multis[3] * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop))
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
							var increment = (maxTarget.path_position + (lifetime * maxTarget.pathSpeed / path_get_length(maxTarget.path_index)) - realMinPos) / (effect[1] - 1)
							
							for (var i = 0; i < effect[1]; i++) {
								instance_create_depth(path_get_x(minTarget.path_index, realMinPos + i * increment), path_get_y(minTarget.path_index, realMinPos + i * increment), 0, projectile_obj, {damage : damage * buffs[1] * buffs[4] * multis[0],
																									speed : projSpeed,
																									effect : [(effect[1] - 1 - i) * lifetime / effect[1] + 1],
																									aoe : aoe,
																									special : special,
																									pierce : pierce * multis[5] + buffs[11],
																									lifetime : lifetime,
																									type : type,
																									detections : [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]],})
							}
					
							firing = true
							attackRemainder += ceil((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - ((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) 
							alarm[0] = ceil((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - floor(attackRemainder)
							if attackRemainder > 1 {
								attackRemainder -= 1
							}
						}
					}
					if (special == "s hacker") {
						// performs buffs for all towers in range of hacker
						var towers = ds_list_create()
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			
						for (var i = 0; i < ds_list_size(towers); i++) {
							if (ds_list_find_value(towers, i).buffs[6] < (effect[0] * buffs[8] * multis[3] * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) and not ds_list_find_value(towers, i).placing) {
								ds_list_find_value(towers, i).buffs[6] = (effect[0] * buffs[8] * multis[3] * (array_contains(global.schizophrenics, ds_list_find_value(towers, i)) * 0.5 * psychiatrist + 1) - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop))
								ds_list_find_value(towers, i).image_blend = c_aqua
							}
						}
					
						if (not firing) {
							// finds targets
							var options = ds_list_create()
							var unsorted = ds_list_create()
							collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Enemy", asset_object), false, true, unsorted, false)
				
							// removes all the enemies that are ghost dead, or cant be detected
							unsorted = remove_undetectable(unsorted, [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]])
				
							// sorts enemies by furthest along path
							repeat (ds_list_size(unsorted)) {
								ds_list_add(options, ds_list_find_value(unsorted, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(unsorted)))
								ds_list_delete(unsorted, max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(unsorted))
							}

							if (ds_list_size(options) > 0) {
								follows = []
								
								if (tier4) {
									array_push(follows, ds_list_find_value(options, irandom_range(0, ds_list_size(options) - 1)))
								}
							
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
									follows[i].hp -= calculate_type_damage(follows[i], [max(detections[0], buffs[3]), max(detections[1], buffs[9]), detections[2]], damage * buffs[1] * buffs[4] * multis[0])
									if follows[i].hp <= 0 {
										// dead enemies are set to ghosts
										follows[i].deactivated = true
										follows[i].alarm[11] = ceil(3 / global.fastForward)
									}
								}
								
								sprite_index = asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_spr")
								firing = true
								attackRemainder += ceil((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - ((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) 
								alarm[0] = ceil((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - floor(attackRemainder)
								if attackRemainder > 1 {
									attackRemainder -= 1
								}
							}
						}
					}
					if (eyesOnThePrize > 0) {
						if (enemySpawner_obj.waveCash) {
							global.money += floor(cost * eyesOnThePrize / 7)
						}
					}
				}
			}
			else {
				// if off cooldown
				if (not firing) {
					// for laser attacking
					var targets = ds_list_create()
					
					if (not tier4) {
						collision_line_list(0, y + aoe * multis[4] - (168 * 0.4 * global.modEffects[10]), room_width, y + aoe * multis[4] - (168 * 0.4 * global.modEffects[10]), tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
						collision_line_list(0, y - aoe * multis[4] - (168 * 0.4 * global.modEffects[10]), room_width, y - aoe * multis[4] - (168 * 0.4 * global.modEffects[10]), tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
					
						var translate = ds_list_create()
						ds_list_copy(translate, targets)
					
						for (var i = 0; i < ds_list_size(targets); i++) {
							ds_list_delete(translate, i)
							if (ds_list_find_index(translate, ds_list_find_value(targets, i)) != -1) {
								ds_list_delete(targets, ds_list_find_index(translate, ds_list_find_value(targets, i)))
							}
							ds_list_copy(translate, targets)
						}
					}
					else {
						collision_circle_list(x, y, 100 + (aoe * multis[5] * 20), tag_get_asset_ids("Enemy", asset_object), false, true, targets, true)
					}
					
					for (var i = 0; i < min(ds_list_size(targets), pierce * multis[5] + buffs[11]); i++) {
						if (instance_exists(ds_list_find_value(targets, i))) {
							if (delay <= 0) {
								ds_list_find_value(targets, i).hp -= damage * buffs[1] * buffs[4] * multis[0]
								if (decamo and shotNum % 3 == 0) {
									ds_list_find_value(targets, i).class[0] = false
								}
								if (burn) {
									ds_list_find_value(targets, i).burning = (damage * buffs[1] * buffs[4] * multis[0] / fireSpeed / 2)
									ds_list_find_value(targets, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
									ds_list_find_value(targets, i).image_blend = c_orange
								}
								if (stun > 0 and damage * buffs[1] * buffs[4] * multis[0] > 0) {
									ds_list_find_value(targets, i).speedMulti = 0
									ds_list_find_value(targets, i).alarm[2] = ceil(damage * buffs[1] * buffs[4] * multis[0] / ds_list_find_value(targets, i).cash * stun * 60 / global.fastForward)
								}
								if ds_list_find_value(targets, i).hp <= 0 {
									// kill dead enemies
									instance_destroy(ds_list_find_value(targets, i))
								}
							}
							else {
								array_push(ds_list_find_value(targets, i).delays, delay)
								var effectSend = [damage * buffs[1] * buffs[4] * multis[0], 0, 0, 1, 0, false]
										
								if (burn) {
									effectSend[1] = damage * buffs[1] * buffs[4] * multis[0] / fireSpeed / 2
									effectSend[2] = ceil(fireSpeed / global.fastForward * 3)
								}
								if (stun > 0 and damage * buffs[1] * buffs[4] * multis[0] > 0) {
									effectSend[3] = 0
									effectSend[4] = ceil(damage * buffs[1] * buffs[4] * multis[0] / ds_list_find_value(targets, i).cash * stun * 60 / global.fastForward)
								}
								if (decamo and shotNum % 3 == 0) {
									effectSend[5] = true
								}
										
								array_push(ds_list_find_value(targets, i).effect, effectSend)
							}
						}
					}
					
					firing = true
					shotNum += 1
					attackRemainder += ceil(fireSpeed / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - ((fireSpeed - beerEffects[0]) / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward)
					alarm[0] = ceil(fireSpeed / buffs[0] / buffs[5] / buffs[10] / multis[1] / global.fastForward) - floor(attackRemainder)
					if (attackRemainder > 1) {
						attackRemainder -= 1
					}
				}
			}
		}
		// adds money at the end of each wave for each money tower
		else if (enemySpawner_obj.waveCash and (bind == 0 or global.wave % (bind * 4) == 0)) {
			var towers = ds_list_create()
			collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			if (tier4) {
				global.money += (effect[0] * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_length(global.schizophrenics) * 0.1 * psychiatrist + 1) - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * (1 - (global.entrepreneurs * 0.1))
			}
			else {
				global.money += (effect[0] * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_length(global.schizophrenics) * 0.1 * psychiatrist + 1) - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop))
			}
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
						effect[3] = 5
						effect[4] = 1.25
						break;
					case 3:
						damage = 10
						fireSpeed = 27
						range = 450
						pierce = 3
						detections = [true, true, false]
						effect[3] = 7
						effect[4] = 1.5
						break;
					case 4:
						damage = 25
						fireSpeed = 12
						range = 650
						pierce = 3
						detections = [true, true, true]
						effect[3] = 10
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
					if (point_in_rectangle(mouse_x, mouse_y, room_width - 64 - string_width(specialTargeting), 496, room_width - 48, 532)) {
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
					if (point_in_rectangle(mouse_x, mouse_y, room_width - 64 - string_width(specialTargeting2), 540, room_width - 48, 576)) {
						// gets index of the special function in conditions
						var place = array_get_index(conditions2, specialTranslations[array_get_index(specialTypes, specialTargeting2)])
					
						if (array_get_index(specialTypes, specialTargeting2) > array_length(specialTypes) - 2) {
							specialTargeting2 = specialTypes[0]
						}
						else {
							specialTargeting2 = specialTypes[array_get_index(specialTypes, specialTargeting2) + 1]
						}
				
						// replaces targeting function with new targeting function
						conditions2[place] = specialTranslations[array_get_index(specialTypes, specialTargeting2)]
					}
				}
				// booster and commander targeting
				else if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 400, room_width - 48, 576)) {
					if (special == "s booster") {
						targetingSelection = true
						collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tower_obj, false, true, targetable, false)
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
				if (point_in_rectangle(mouse_x, mouse_y, room_width - 368, 592, room_width - 48, 896) and special != "debt collector" and global.money >= ceil(costs[towerType][upgrade] * (1 - buffs[6]) * global.modEffects[11]) and array_length(global.upgrades[towerType]) > upgrade) {
					if (not (array_contains(struct_get_names(global.upgrades[towerType][upgrade]), "addiction") and not global.addictionBuyable and global.wave > 30)) {
						global.money -= ceil(costs[towerType][upgrade] * (1 - buffs[6]) * (1 - buffs[13]) * (1 - buffs[14]) * (1 - buffs[15]) * global.modEffects[11])
						cost += ceil(costs[towerType][upgrade] * (1 - buffs[6]) * (1 - buffs[13]) * (1 - buffs[14]) * (1 - buffs[15]) * global.modEffects[11])
				
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
									if (specialTargeting == "Non-solid") {
										var place = array_get_index(conditions, specialTranslations[array_get_index(specialTypes, specialTargeting)])
										conditions[place] = noneTargeting
										specialTargeting = "None"
									}
									break;
								case "buff":
									if (global.upgrades[towerType][upgrade].buff > 0) {
										multis[3] += global.upgrades[towerType][upgrade].buff * effectiveness[upgrade]
									}
									else {
										multis[3] = multis[3] / abs(global.upgrades[towerType][upgrade].buff * effectiveness[upgrade] - 1)
									}
									break;
								case "d2":
									detections[2] = true
									array_push(global.schizophrenics, self)
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
								case "lifeDeduct":
									lifeDeduct += global.upgrades[towerType][upgrade].lifeDeduct * effectiveness[upgrade]
									break;
								case "AOE":
									if (global.upgrades[towerType][upgrade].AOE > 0) {
										multis[4] += global.upgrades[towerType][upgrade].AOE * effectiveness[upgrade]
									}
									else {
										multis[4] = multis[4] / abs(global.upgrades[towerType][upgrade].AOE * effectiveness[upgrade] - 1)
									}
									break;
								case "slow":
									slow += global.upgrades[towerType][upgrade].slow * effectiveness[upgrade]
									break;
								case "decamo":
									decamo = true
									break;
								case "pierce":
									if (global.upgrades[towerType][upgrade].pierce > 0) {
										multis[5] += global.upgrades[towerType][upgrade].pierce * effectiveness[upgrade]
									}
									else {
										multis[5] = multis[5] / abs(global.upgrades[towerType][upgrade].pierce * effectiveness[upgrade] - 1)
									}
									break;
								case "delay":
									delay += global.upgrades[towerType][upgrade].delay * effectiveness[upgrade]
									break;
								case "lead":
									lead = false
									break;
								case "gunner4":
									pierce = pierce * 2
									fireSpeed = 30
									damage = 3
									range = 350
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "sniper4":
									damage = 14
									fireSpeed = 120
									range = 600
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "railgunner4":
									damage = 80
									fireSpeed = 600
									pierce = pierce * 1.5
									doubleShot = 10
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "evaporator4":
									damage = 2500
									fireSpeed = 1200
									pierce = pierce * 50
									range = 500
									aoe = 5
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "boomer4":
									damage = 3
									fireSpeed = 30
									range = 250
									aoe = 9
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "flamer4":
									fireSpeed = 12
									range = 250
									pierce = pierce * 20
									effect = [1/10, 300]
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "puncher4":
									fireSpeed = 21
									damage = 10
									pierce = pierce * 5/7
									stun += 6
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "laser4":
									damage = 7
									pierce = pierce * 4
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "cheerleader4":
									effect[0] = 1.2
									array_push(effect, 1.1)
									range = 350
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "moneymaker4":
									effect[0] = 300
									global.entrepreneurs += 1
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "spotter4":
									range = 550
									effect[0] = 1.2
									effect[0] = 1.3
									detections = [true, true, false]
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "booster4":
									effect[0] = 1.75
									array_push(effect, 1.25, 2, 0.75)
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "commander4":
									effect[0] = 1.2
									effect[1] = 30
									damage = 25
									fireSpeed = 400
									lifetime = 120
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "hacker4":
									effect[0] = 0.15
									damage = 7
									range = 500
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "rapper4":
									effect[0] = 500
									damage = 7.5
									fireSpeed = 9
									pierce = pierce * 7/5
									tier4 = true
									sprite_index = asset_get_index("tower" + string(towerType + tier4 * 16) + "_spr")
									break;
								case "psychiatrist":
									psychiatrist += global.upgrades[towerType][upgrade].psychiatrist * effectiveness[upgrade]
									break;
								case "eyesOnThePrize":
									eyesOnThePrize += global.upgrades[towerType][upgrade].eyesOnThePrize * effectiveness[upgrade]
									break
								case "notManyBeans":
									notManyBeans += global.upgrades[towerType][upgrade].notManyBeans * effectiveness[upgrade]
									break;
								case "sweatshop":
									sweatshop += global.upgrades[towerType][upgrade].sweatshop * effectiveness[upgrade]
									break;
								case "bind":
									bind += global.upgrades[towerType][upgrade].bind * effectiveness[upgrade]
									break;
								case "lesbian":
									if (lesbian == 0) {
										global.lesbians[towerType - 8] += 1
									}
									lesbian += global.upgrades[towerType][upgrade].lesbian * effectiveness[upgrade]
									break;
								case "childSupport":
									childSupport += global.upgrades[towerType][upgrade].childSupport * effectiveness[upgrade] / 10
									global.health -= global.upgrades[towerType][upgrade].childSupport * effectiveness[upgrade] * 10
									break;
								case "addiction":
									joathe = 1
									countdown = 5
									addiction = true
									if (global.wave <= 30) {
										global.addictionBuyable = true
									}
									with (tower_obj) {
										buffs = [1, 1, 1, false, 1, 1, 0, 1, 1, false, 1, 0, 1, 0, 0, 0]
										image_blend = c_white
										if (towerType == 11) {
											if (array_length(buffing) > 0) {
												var towers = ds_list_create()
												collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
												buffing[0].buffs[4] = (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
												buffing[0].buffs[15] = (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
												if (tier4) {
													buffing[0].buffs[10] = (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
													buffing[0].buffs[11] = (effect[2] - (ds_list_size(towers) * (effect[2] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[2] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
													buffing[0].buffs[12] = (effect[3] - (ds_list_size(towers) * (effect[3] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[3] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
												}
												buffing[0].image_blend = c_blue
											}
										}
										else {
											buffing = []
										}
									}
									break;
								case "beer":
									beer += global.upgrades[towerType][upgrade].beer * effectiveness[upgrade]
									break;
								case "joathe":
									joathe += global.upgrades[towerType][upgrade].joathe * effectiveness[upgrade]
									break;
							}
						}
				
						upgrade += 1
					}
				}
				// selling
				if (point_in_rectangle(mouse_x, mouse_y, room_width - 222, 944, room_width - 32, 1040) and joathe == 0) {
					// gives 60% of money back, then closes the upgrade menu
					global.money += floor(cost * 0.6)
					selected = false
					global.upgradeMenu = false
				
					if (string_char_at(special, 0) == "s") {
						with (tower_obj) {
							buffs = [1, 1, 1, false, 1, 1, 0, 1, 1, false, 1, 0, 1, 0, 0, 0]
							image_blend = c_white
							if (towerType == 11) {
								if (array_length(buffing) > 0) {
									var towers = ds_list_create()
									collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
									buffing[0].buffs[4] = (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
									buffing[0].buffs[15] = (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
									if (tier4) {
										buffing[0].buffs[10] = (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
										buffing[0].buffs[11] = (effect[2] - (ds_list_size(towers) * (effect[2] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[2] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
										buffing[0].buffs[12] = (effect[3] - (ds_list_size(towers) * (effect[3] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[3] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
									}
									buffing[0].image_blend = c_blue
								}
							}
							else {
								buffing = []
							}
						}
					}
					
					global.towers -= 1
					instance_destroy()
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
			global.towers += 1
			
			if (global.first) {
				global.first = false
				if (global.fool and towerType != 4) {
					global.modEffects[8] -= 35
					global.health -= 35
				}
			}
		}
		// destroys tower if sent in the tower menu after pulled out of it
		if ((xprevious < room_width - 384 or mouse_check_button_pressed(mb_left)) and x > room_width - 384) {
			settingInit_obj.placing = false
			instance_destroy()
		}
	}
	if (beer > 0) {
		alarm[1] = 1
	}
	else {
		alarm[1] = 0
	}
	
	if (enemySpawner_obj.waveCash and addiction) {
		countdown -= 1
		if (countdown == 0) {
			settingInit_obj.alarm[0] = 1
		}
	}
}

if (towerType != 6) {
	if (floor(image_index) == sprite_get_number(sprite_index) - 1 and sprite_index == asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_spr")) {
		image_speed = 0
	}
}
else {
	if (floor(image_index) == sprite_get_number(sprite_index) - 1 and sprite_index == asset_get_index("towerShooting" + string(towerType + tier4 * 16) + "_" + puncherAlt + "_spr")) {
		image_speed = 0
	}
}

image_speed = sign(image_speed) * global.fastForward
depth = -y