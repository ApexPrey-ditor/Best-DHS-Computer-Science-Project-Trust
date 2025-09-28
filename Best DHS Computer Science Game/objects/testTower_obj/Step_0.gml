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
				// MAKE IT SO IT DOESNT CHANGE THIS WHEN CLICKING ON A DIFFERNET OBJECT
				if (position_empty(mouse_x, mouse_y)) {
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
		// destroys tower if placed out of bounds
		if (mouse_check_button_pressed(mb_left) and x > room_width - 384) {
			settingInit_obj.placing = false
			instance_destroy()
		}
	}
	// checks if the tower isnt the money making tower
	else if (special != "money") {
		if (range > 0) {
			if (special != "firerate") {
				// find object with enemy tag furthest along the path
				var target = collision_circle(x, y, range, tag_get_asset_ids("Enemy", asset_object), false, true)

				if (instance_exists(target) and not firing) {
					// calculate where the enemy will be along the path
					var leadPosition = 0
					if (projSpeed > 0) {
						leadPosition = target.path_position + ((point_distance(x, y, target.x, target.y) / projSpeed) * target.pathSpeed / path_get_length(target.path_index))
					}
					else {
						leadPosition = target.path_position
					}
					// creates a projectile with the tower stats, then waits fireSpeed until it can shoot again
					repeat(floor(attackRemainder) + 1) {
						instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																						speed : projSpeed,
																						aoe : aoe,
																						special : special,
																						direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
					// system for fractions of frames (ask turtle)
						if (floor(attackRemainder > 0)) {
							attackRemainder -= 1
						}
					}
					firing = true
					attackRemainder += fireSpeed % (firerateBuff / global.fastForward)
					alarm[0] = ceil(fireSpeed / firerateBuff / global.fastForward)
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
				repeat(floor(attackRemainder) + 1) {
					instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																					speed : projSpeed,
																					aoe : aoe,
																					special : special,
																					direction : direction})
					if (floor(attackRemainder > 0)) {
						attackRemainder -= 1
					}
				}
				firing = true
				attackRemainder += fireSpeed % (firerateBuff / global.fastForward)
				alarm[0] = ceil(fireSpeed / firerateBuff / global.fastForward)
			}
		}
	}
	// adds money at the end of each wave for each money tower
	else if (global.waveTransition == 1) {
		global.money += damage
	}
}