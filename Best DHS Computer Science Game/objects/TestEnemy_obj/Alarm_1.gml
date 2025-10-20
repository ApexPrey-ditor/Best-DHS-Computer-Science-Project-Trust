// special abilities that have cooldowns for enemies
switch (type) {
	case 8:
		for (var i = 0; i < 3; i++) {
				instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 6, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
		}
		alarm[1] = 300
	case 18:
		for (var i = 0; i < 3; i++) {
				instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 15, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
		}
		alarm[1] = 420
	case 19:
		pathSpeed = 10 + dsin(hesCrazy) * 20
		hesCrazy += 2
		alarm[1] = 1
	case 23:
		hp = 100
		alarm[1] = 60
	case 25:
		for (var i = 0; i < 5; i++) {
				instance_create_layer(x, y, "Enemies", testEnemy_obj, {type : 22, spath_sposition : path_position - ((i - 2) * 0.02 + 0.01)})
		}
		alarm[1] = 420
}