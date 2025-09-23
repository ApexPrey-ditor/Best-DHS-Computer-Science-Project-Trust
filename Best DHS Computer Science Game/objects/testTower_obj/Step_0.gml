if placing {
	x = mouse_x
	y = mouse_y
	
	if (mouse_check_button_pressed(mb_left) and bbox_right < room_width - 384 and bbox_left > 0 and bbox_top > 0 and bbox_bottom < room_height and not place_meeting(x, y, track_obj) and not place_meeting(x, y, testTower_obj)) {
		placing = false
		settingInit_obj.placing = false
	}
}
else {
	if range > 0 {
		if special != "firerate" {
			// find object with enemy tag furthest along the path
			var target = collision_circle(x, y, range, tag_get_asset_ids("Enemy", asset_object), false, true)

			if (instance_exists(target) and not firing) {
				// calculate where the enemy will be along the path
				var leadPosition = 0
				if projSpeed > 0 {
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
																				direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
				firing = true
				alarm[0] = ceil(fireSpeed / firerateBuff)
			}
		}
		else {
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
		if not firing {
			instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																			speed : projSpeed,
																			aoe : aoe,
																			special : special,
																			direction : direction})
			firing = true
			alarm[0] = fireSpeed
		}
	}
}