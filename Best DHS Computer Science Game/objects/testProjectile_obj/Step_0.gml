// stops all projectiles when paused
if (global.paused) {
	speed = 0
}
else {
	// sets aftereffect for punches and lasers, and sets speed for projectiles
	switch (type) {
		case 0:
			speed = prespeed * global.fastForward
			break;
	}
	// checks impacts for normal projectiles
	if (type == 0) {
		// gets all thouching enemies
		var enemies = ds_list_create()
		instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)

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
				for (var i = 0; i < ds_list_size(enemies); i++) {
					ds_list_find_value(enemies, i).hp -= damage
					if (ds_list_find_value(enemies, i).hp <= 0) {
						instance_destroy(ds_list_find_value(enemies, i))
					}
				}
			}
			else {
				// checks for enemies hit by flamethrower
				if (special == "flame") {
					for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
						ds_list_find_value(enemies, i).hp -= damage
						ds_list_find_value(enemies, i).burning = effect[0]
						ds_list_find_value(enemies, i).alarm[0] = effect[1]
						ds_list_find_value(enemies, i).image_blend = c_orange
						
						if (ds_list_find_value(enemies, i).hp <= 0) {
							instance_destroy(ds_list_find_value(enemies, i))
						}
					}
					
					type = -2
					alarm[0] = 60 / global.fastForward
				}
				else {
					// hit as many enemies as can, if more enemies than pierce delete projectile
					for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
						ds_list_find_value(enemies, i).hp -= damage
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
	else {
		// checks for enemies hit by laser or punch
		if (place_meeting(x, y, tag_get_asset_ids("Enemy", asset_object)) and type > 0) {
			var enemies = ds_list_create()
			instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
			for (var i = 0; i < ds_list_size(enemies); i++) {
				ds_list_find_value(enemies, i).hp -= damage
				if (ds_list_find_value(enemies, i).hp <= 0) {
					instance_destroy(ds_list_find_value(enemies, i))
				}
			}

			type = -1
		}
		// adds burning to all enemies hit by flames
		if type == -2 {
			speed = prespeed * global.fastForward
			image_xscale -= 1 / (120 * global.fastForward)
			image_yscale -= 1 / (120 * global.fastForward)
			image_alpha -= 1 / (90 * global.fastForward)
		}
	}
}