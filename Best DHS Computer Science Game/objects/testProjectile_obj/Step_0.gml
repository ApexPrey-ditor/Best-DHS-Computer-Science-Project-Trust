// stops all projectiles when paused
if (global.paused) {
	speed = 0
}
else {
	// checks impacts for normal projectiles
	if (type == 0) {
		// adjusts speed based on fastForward
		speed = prespeed * global.fastForward
		
		// gets all thouching enemies
		var enemies = ds_list_create()
		instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
		
		// removes all the enemies that are ghost dead, or cant be detected
		enemies = remove_undetectable(enemies, detections)

		if (ds_list_size(enemies) > 0) {
			// checks if bullet is explosive
			if (aoe > 0) {
				sprite_index = explosion_spr
				speed = 0
				image_xscale = aoe
				image_yscale = aoe
				alarm[0] = 30
				type = -1
				// checks for all enemies in the explosion and causes damage and deaths
				enemies = ds_list_create()
				instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
				
				// removes all the enemies that are ghost dead, or cant be detected
				enemies = remove_undetectable(enemies, detections)
				
				for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
					ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), detections, damage)
					if (ds_list_find_value(enemies, i).hp <= 0) {
						instance_destroy(ds_list_find_value(enemies, i))
					}
				}
			}
			else if (special == "flame") {
				// checks for enemies hit by flamethrower
				for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
					ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), detections, damage)
					ds_list_find_value(enemies, i).burning = effect[0]
					ds_list_find_value(enemies, i).alarm[0] = effect[1]
					ds_list_find_value(enemies, i).image_blend = c_orange
					if (ds_list_find_value(enemies, i).hp <= 0) {
						instance_destroy(ds_list_find_value(enemies, i))
					}
				}
				pierce -= ds_list_size(enemies)
				if pierce <= 0 {
					instance_destroy()
				}
			}
			else {
				// hit as many enemies as can, if more enemies than pierce delete projectile
				for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
					ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), detections, damage)
					if (ds_list_find_value(enemies, i).hp <= 0) {
						instance_destroy(ds_list_find_value(enemies, i))
					}
				}
				pierce -= ds_list_size(enemies)
				if pierce <= 0 {
					instance_destroy()
				}
			}
		}
	}
}