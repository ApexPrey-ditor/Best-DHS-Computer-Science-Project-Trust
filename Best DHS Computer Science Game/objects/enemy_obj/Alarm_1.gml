// special abilities that have cooldowns for enemies
switch (type) {
	case 8:
		enemySpawner_obj.enemies += 3
		for (var i = 0; i < 3; i++) {
			instance_create_layer(x, y, "Enemies", enemy_obj, {type : 6, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
		}
		alarm[1] = ceil(300 / global.fastForward)
		break;
	case 18:
		enemySpawner_obj.enemies += 3
		for (var i = 0; i < 3; i++) {
			instance_create_layer(x, y, "Enemies", enemy_obj, {type : 15, spath_sposition : path_position - ((i - 1) * 0.02 + 0.01)})
		}
		alarm[1] = ceil(420 / global.fastForward)
		break;
	case 19:
		pathSpeed = 10 + dsin(hesCrazy) * 20
		hesCrazy += 2 * global.fastForward
		alarm[1] = 1
		break;
	case 23:
		hp = 100
		alarm[1] = ceil(60 / global.fastForward)
		break;
	case 25:
		enemySpawner_obj.enemies += 5
		for (var i = 0; i < 5; i++) {
			instance_create_layer(x, y, "Enemies", enemy_obj, {type : 22, spath_sposition : path_position - ((i - 2) * 0.02 + 0.01)})
		}
		alarm[1] = ceil(420 / global.fastForward)
		break;
}