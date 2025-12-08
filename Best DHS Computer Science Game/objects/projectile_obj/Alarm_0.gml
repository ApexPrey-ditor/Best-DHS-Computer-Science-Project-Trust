// destroys projectile after duration is up

if (type != 1) {
	instance_destroy()
}
else {
	// explodes if commander attack
	sprite_index = explosion_spr
	speed = 0
	image_xscale = aoe
	image_yscale = aoe
	alarm[0] = 30 / global.fastForward
	type = -1
	
	// checks for all enemies in the explosion and causes damage and deaths
	var enemies = ds_list_create()
	instance_place_list(x, y, tag_get_asset_ids("Enemy", asset_object), enemies, false)
				
	// removes all the enemies that are ghost dead, or cant be detected
	enemies = remove_undetectable(enemies, detections)
				
	for (var i = 0; i < min(ds_list_size(enemies), pierce); i++) {
		ds_list_find_value(enemies, i).hp -= calculate_type_damage(ds_list_find_value(enemies, i), [true, true, detections[2]], damage)
		if (ds_list_find_value(enemies, i).hp <= 0) {
			instance_destroy(ds_list_find_value(enemies, i))
		}
	}
}