// spawns enemies around necromancer enemy
switch (type) {
	case 8:
		for (var i = 0; i < 3; i++) {
				instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 6, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
		}
		alarm[1] = 300;
	case 18:
		for (var i = 0; i < 3; i++) {
				instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 15, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
		}
		alarm[1] = 420;
}