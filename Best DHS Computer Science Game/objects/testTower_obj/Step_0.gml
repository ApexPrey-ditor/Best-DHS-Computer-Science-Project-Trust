if (not global.paused) {
	if (not placing) {
		if (mouse_check_button_pressed(mb_left)) {
			// checks if theres a tower under the mouse when clicked
			if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
				selected = not selected
				global.upgradeMenu = selected
			}
			else {
				selected = false
				// deselects the upgrade menu if clicking empty space
				if (not position_meeting(mouse_x, mouse_y, tag_get_asset_ids("Tower", asset_object))) {
					global.upgradeMenu = selected
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
		if (xprevious < room_width - 384 and x > room_width - 384) {
			settingInit_obj.placing = false
			instance_destroy()
		}
	}
	// checks if the tower isnt the money making tower
	else if (special != "money") {
		if (range > 0) {
			if (special != "firerate") {
				// finds target depending on targeting
				var options = ds_list_create()
				collision_circle_list(x, y, range, tag_get_asset_ids("Enemy", asset_object), false, true, options, false)
				
				// initializes variables needed for targeting
				var target = ds_list_find_value(options, 0)
				var highscore = 0
				
				switch (targeting) {
					case "first":
						if (special == "flame") {
							// if flamethrower checks for first enemy that isn't on fire
							target = ds_list_find_value(options, 0)
							
							for (var i = 0; i < ds_list_size(options); i++) {
								if ds_list_find_value(options, i).burning == 0 {
									target = ds_list_find_value(options, i)
									break;
								}
							}
						}
						else {
							// finds first enemy
							target = ds_list_find_value(options, 0)
						}
						break;
					case "last":
						if (special == "flame") {
							// if flamethrower checks for last enemy that isn't on fire by iterating backwards
							target = ds_list_find_value(options, ds_list_size(options) - 1)
							
							for (var i = ds_list_size(options) - 1; i >= 0; i--) {
								if ds_list_find_value(options, i).burning == 0 {
									target = ds_list_find_value(options, i)
									break;
								}
							}
						}
						else {
							// finds last enemy
							target = ds_list_find_value(options, ds_list_size(options) - 1)
						}
						break;
					case "strong":
						highscore = -infinity
						for (var i = 0; i < ds_list_size(options); i++) {
							if (special == "flame" ) {
								// if flamethrower finds enemy with highest hp if both enemies are burning or not burning, otherwise not burning enemy always takes priority
								if ((target.burning != 0 and ds_list_find_value(options, i).burning == 0) or
									(target.burning == 0 and ds_list_find_value(options, i).burning == 0 and ds_list_find_value(options, i).hp > highscore) or
									(target.burning != 0 and ds_list_find_value(options, i).burning != 0 and ds_list_find_value(options, i).hp > highscore)) {
									target = ds_list_find_value(options, i)
									highscore = ds_list_find_value(options, i).hp
								}
							}
							else {
								// finds enemy with highest hp using a score system
								if (ds_list_find_value(options, i).hp > highscore) {
									target = ds_list_find_value(options, i)
									highscore = ds_list_find_value(options, i).hp
								}
							}
						}
						break;
					case "weak":
						highscore = infinity
						for (var i = 0; i < ds_list_size(options); i++) {
							if (special == "flame" ) {
								// if flamethrower finds enemy with lowest hp if both enemies are burning or not burning, otherwise not burning enemy always takes priority
								if ((target.burning != 0 and ds_list_find_value(options, i).burning == 0) or
									(target.burning == 0 and ds_list_find_value(options, i).burning == 0 and ds_list_find_value(options, i).hp < highscore) or
									(target.burning != 0 and ds_list_find_value(options, i).burning != 0 and ds_list_find_value(options, i).hp < highscore)) {
									target = ds_list_find_value(options, i)
									highscore = ds_list_find_value(options, i).hp
								}
							}
							else {
								// finds enemy with lowest hp using a score system
								if (ds_list_find_value(options, i).hp < highscore) {
									target = ds_list_find_value(options, i)
									highscore = ds_list_find_value(options, i).hp
								} 
							}
						}
						break;
					case "farthest":
						highscore = -infinity
						for (var i = 0; i < ds_list_size(options); i++) {
							if (special == "flame" ) {
								// if flamethrower finds enemy with highest distance using if both enemies are burning or not burning, otherwise not burning enemy always takes priority
								if ((target.burning != 0 and ds_list_find_value(options, i).burning == 0) or
									(target.burning == 0 and ds_list_find_value(options, i).burning == 0 and distance_to_object(ds_list_find_value(options, i)) > highscore) or
									(target.burning != 0 and ds_list_find_value(options, i).burning != 0 and distance_to_object(ds_list_find_value(options, i)) > highscore)) {
									target = ds_list_find_value(options, i)
									highscore = distance_to_object(ds_list_find_value(options, i))
								}
							}
							else {
								// finds enemy with highest distance using a score system
								if (distance_to_object(ds_list_find_value(options, i)) > highscore) {
									target = ds_list_find_value(options, i)
									highscore = distance_to_object(ds_list_find_value(options, i))
								}
							}
						}
						break;
					case "closest":
						highscore = infinity
						for (var i = 0; i < ds_list_size(options); i++) {
							if (special == "flame" ) {
								// if flamethrower finds enemy with lowest distance using if both enemies are burning or not burning, otherwise not burning enemy always takes priority
								if ((target.burning != 0 and ds_list_find_value(options, i).burning == 0) or
									(target.burning == 0 and ds_list_find_value(options, i).burning == 0 and distance_to_object(ds_list_find_value(options, i)) < highscore) or
									(target.burning != 0 and ds_list_find_value(options, i).burning != 0 and distance_to_object(ds_list_find_value(options, i)) < highscore)) {
									target = ds_list_find_value(options, i)
									highscore = distance_to_object(ds_list_find_value(options, i))
								}
							}
							else {
								// finds enemy with lowest distance using a score system
								if (distance_to_object(ds_list_find_value(options, i)) < highscore) {
									target = ds_list_find_value(options, i)
									highscore = distance_to_object(ds_list_find_value(options, i))
								}
							}
						}
						break;
				}

				if (instance_exists(target) and not firing) {
					var flamethrower = part_emitter_create(ParticleSystem1.id)
		
					part_emitter_region(CheksEngine.mainps, flamethrower, truex + 16, truex + 16, truey + 16, truey + 16, ps_shape_rectangle, ps_distr_linear)
					part_emitter_burst(CheksEngine.mainps, flamethrower, CheksEngine.blooddeath, 15)
		
					part_emitter_destroy(CheksEngine.mainps, flamethrower)
					
					// calculate where the enemy will be along the path
					var leadPosition = 0
					if (projSpeed > 0) {
						leadPosition = target.path_position + ((point_distance(x, y, target.x, target.y) / projSpeed) * target.pathSpeed / path_get_length(target.path_index))
					}
					else {
						leadPosition = target.path_position
					}
					// creates a projectile with the tower stats, then waits fireSpeed until it can shoot again
					instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																					speed : projSpeed,
																					aoe : aoe,
																					special : special,
																					spread : spread,
																					effect : effect,
																					pierce : pierce,
																					type : type,
																					lifetime : lifetime,
																					direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
					// system for fractions of frames (ask turtle)
					firing = true
					attackRemainder += ceil(fireSpeed / firerateBuff / global.fastForward) - (fireSpeed / firerateBuff / global.fastForward) 
					alarm[0] = ceil(fireSpeed / firerateBuff / global.fastForward) - floor(attackRemainder)
					if attackRemainder > 1 {
						attackRemainder -= 1
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
				instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																					speed : projSpeed,
																					aoe : aoe,
																					special : special,
																					spread : spread,
																					effect : effect,
																					pierce : pierce,
																					type : type,
																					lifetime : lifetime,
																					direction : direction})
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
	else if (global.waveTransition == 1) {
		global.money += damage
	}
}