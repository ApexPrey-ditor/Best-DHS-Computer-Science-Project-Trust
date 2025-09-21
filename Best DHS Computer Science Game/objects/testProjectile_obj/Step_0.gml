if (aftereffect == 0) {
	// checks if touching enemy
	var enemy = instance_place(x, y, tag_get_asset_ids("Enemy", asset_object))

	if instance_exists(enemy) {
		// if so decrease enemy hp and delete projectile
		enemy.hp -= damage
		if (enemy.hp <= 0) {
			instance_destroy(enemy)
		}
	
		instance_destroy()
	}
}
else {
	if (place_meeting(x, y, tag_get_asset_ids("Enemy", asset_object)) and aftereffect != -1) {
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
}