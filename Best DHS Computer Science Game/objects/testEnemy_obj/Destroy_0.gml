// gives money and reduces number of enemies on death
enemySpawner_obj.enemies -= 1

// only does on death or cash if enemy was killed by tower
if (skip == false) {
	global.money += cash

	// spawns enemies on death if necromancer enemy
	switch (type) {
		case 8:
			enemySpawner_obj.enemies += 3
			for (var i = 0; i < 3; i++) {
					instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 6, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
			}
			break;
		case 18:
			enemySpawner_obj.enemies += 3
			for (var i = 0; i < 3; i++) {
					instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 15, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
			}
			break;
		case 25:
			enemySpawner_obj.enemies += 5
			for (var i = 0; i < 5; i++) {
					instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 22, spath_sposition : path_position - ((i - 2) * 0.02 + 0.01)})
			}
			break;
	}
}