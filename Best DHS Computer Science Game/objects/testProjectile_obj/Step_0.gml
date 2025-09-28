// stops all projectiles when paused
if (global.paused) {
	speed = 0
}
else {
	// sets aftereffect for punches and lasers, and sets speed for projectiles
	if (prespeed == 0) {
		aftereffect = 6 / global.fastForward
	}
	else if (prespeed < 0) {
		aftereffect = -speed  / global.fastForward
	}
	else {
		speed = prespeed * global.fastForward
	}
	// checks impacts for punches
	if (aftereffect == 0) {
		// checks if touching enemy
		var enemy = instance_place(x, y, tag_get_asset_ids("Enemy", asset_object))
		if (instance_exists(enemy)) {
			// checks if bullet is explosive
			if (aoe > 0) {
				sprite_index = explosion_spr
				speed = 0
				image_xscale = aoe
				image_yscale = aoe
				alarm[0] = 30
				aftereffect = -1
				// checks for all enemies in the explosion and causes damage and deaths
				var enemies = ds_list_create()
				instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
				for (var i = 0; i < ds_list_size(enemies); i++) {
					ds_list_find_value(enemies, i).hp -= damage
					// ADD PIERCE LIMIT
					if (ds_list_find_value(enemies, i).hp <= 0) {
						instance_destroy(ds_list_find_value(enemies, i))
					}
				}
			}
			else {
				// checks for enemies hit by flamethrower
				if (special == "flame") {
					x = path_get_x(enemy.path_index, enemy.path_position)
					y = path_get_y(enemy.path_index, enemy.path_position)
				
					enemy.hp -= damage
					if (enemy.hp <= 0) {
						instance_destroy(enemy)
					}
			
					aftereffect = -2
					sprite_index = fire_spr
					image_xscale = 1
					image_yscale = 1
					speed = 0
					alarm[0] = 60
				}
				else {
					// if so decrease enemy hp and delete projectile
					enemy.hp -= damage
					if (enemy.hp <= 0) {
						instance_destroy(enemy)
					}
					instance_destroy()
				}
			}
		}
	}
	else {
		// checks for enemies hit by laser or punch during aftereffect
		if (place_meeting(x, y, tag_get_asset_ids("Enemy", asset_object)) and aftereffect > 0) {
			var enemies = ds_list_create()
			instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
			for (var i = 0; i < ds_list_size(enemies); i++) {
				ds_list_find_value(enemies, i).hp -= damage
				if (ds_list_find_value(enemies, i).hp <= 0) {
					instance_destroy(ds_list_find_value(enemies, i))
				}
			}
		
			alarm[0] = aftereffect
			aftereffect = -1
		}
		// adds burning to all enemies hit by flames
		if aftereffect == -2 {
			image_xscale -= 1 / 120
			image_yscale -= 1 / 120
			image_alpha -= 1 / 90
		
			var enemies = ds_list_create()
			instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
			for (var i = 0; i < ds_list_size(enemies); i++) {
				ds_list_find_value(enemies, i).burning = 3 / 60
				ds_list_find_value(enemies, i).alarm[0] = 200
				ds_list_find_value(enemies, i).image_blend = c_orange
			}
		}
	}
}