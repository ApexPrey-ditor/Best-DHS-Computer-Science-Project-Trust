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
			if (special == "flame") {
				// checks for enemies hit by flamethrower
				for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
					if (not array_contains(hit, ds_list_find_value(enemies, i))) {
						if (delay <= 0) {
							ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), detections, damage)
							array_push(hit, ds_list_find_value(enemies, i))
							ds_list_find_value(enemies, i).burning = calculate_type_damage(ds_list_find_value(enemies, i), detections, effect[0])
							ds_list_find_value(enemies, i).alarm[0] = ceil(effect[1] / global.fastForward)
							ds_list_find_value(enemies, i).image_blend = c_orange
							if (decamo and shotNum % 3 == 0) {
								ds_list_find_value(enemies, i).class[0] = false
							}
							if (stun > 0 and calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) > 0) {
								ds_list_find_value(enemies, i).speedMulti = 0
								ds_list_find_value(enemies, i).alarm[2] = ceil(calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) / ds_list_find_value(enemies, i).cash * stun * 60 / global.fastForward)
							}
							if (ds_list_find_value(enemies, i).hp <= 0) {
								instance_destroy(ds_list_find_value(enemies, i))
							}
						}
						else {
							array_push(ds_list_find_value(enemies, i).delays, delay)
							var effectSend = [calculate_type_damage(ds_list_find_value(enemies, i), detections, damage), calculate_type_damage(ds_list_find_value(enemies, i), detections, effect[0]), ceil(effect[1] / global.fastForward), 1, 0, false]
							
							if (stun > 0 and calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) > 0) {
								effectSend[3] = 0
								effectSend[4] = ceil(calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) / ds_list_find_value(enemies, i).cash * stun * 60 / global.fastForward)
							}
							if (decamo and shotNum % 3 == 0) {
								effectSend[5] = true
							}
										
							array_push(ds_list_find_value(enemies, i).effect, effectSend)
						}
					}
				}
				pierce -= ds_list_size(enemies)
				if pierce <= 0 {
					instance_destroy()
				}
			}
			// checks if bullet is explosive
			else if (aoe > 0) {
				sprite_index = explosion_spr
				speed = 0
				image_xscale = aoe
				image_yscale = aoe
				alarm[0] = 30 / global.fastForward
				type = -1
				// checks for all enemies in the explosion and causes damage and deaths
				enemies = ds_list_create()
				instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
				
				// removes all the enemies that are ghost dead, or cant be detected
				enemies = remove_undetectable(enemies, detections)
				
				for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
					if (delay <= 0) {
						ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), detections, damage)
						if (decamo and shotNum % 3 == 0) {
							ds_list_find_value(enemies, i).class[0] = false
						}
						if (burn) {
							ds_list_find_value(enemies, i).burning = (calculate_type_damage(ds_list_find_value(enemies, i), [detections[0], true, detections[2]], damage) / fireSpeed / 2)
							ds_list_find_value(enemies, i).alarm[0] = ceil(fireSpeed / global.fastForward * 3)
							ds_list_find_value(enemies, i).image_blend = c_orange
						}
						if (stun > 0 and calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) > 0) {
							ds_list_find_value(enemies, i).speedMulti = 0
							ds_list_find_value(enemies, i).alarm[2] = ceil(calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) / ds_list_find_value(enemies, i).cash * stun * 60 / global.fastForward)
						}
						if (ds_list_find_value(enemies, i).hp <= 0) {
							instance_destroy(ds_list_find_value(enemies, i))
						}
					}
					else {
						array_push(ds_list_find_value(enemies, i).delays, delay)
						var effectSend = [calculate_type_damage(ds_list_find_value(enemies, i), detections, damage), 0, 0, 1, 0, false]
										
						if (burn) {
							effectSend[1] = (calculate_type_damage(ds_list_find_value(enemies, i), [detections[0], true, detections[2]], damage) / fireSpeed / 2)
							effectSend[2] = ceil(fireSpeed / global.fastForward * 3)
						}
						if (stun > 0 and calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) > 0) {
							effectSend[3] = 0
							effectSend[4] = ceil(calculate_type_damage(ds_list_find_value(enemies, i), detections, damage) / ds_list_find_value(enemies, i).cash * stun * 60 / global.fastForward)
						}
						if (decamo and shotNum % 3 == 0) {
							effectSend[5] = true
						}
										
						array_push(ds_list_find_value(enemies, i).effect, effectSend)
					}
				}
			}
			else {
				// hit as many enemies as can, if more enemies than pierce delete projectile
				for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
					if (not array_contains(hit, ds_list_find_value(enemies, i))) {
						ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), detections, damage)
						array_push(hit, ds_list_find_value(enemies, i))
						if (ds_list_find_value(enemies, i).hp <= 0) {
							if (special == "debt collector") {
								creator.kills += 1
								ds_list_find_value(enemies, i).cash = floor(effect[4] * ds_list_find_value(enemies, i).cash)
							}
							instance_destroy(ds_list_find_value(enemies, i))
						}
						
						pierce -= 1
					}
				}
				if pierce <= 0 {
					instance_destroy()
				}
			}
		}
	}
}

depth = -y