// iterates through all enemy spawns
for (var i = 0; i < array_length(weights); i++) {
	// adds "points" based on weights and distance form desired cost
	values[i] += weights[i] * min((restrictions[i] - global.modEffects[15]) / global.wave + 1, global.wave / (restrictions[i] - global.modEffects[15]) + 1)
	// disables enemy if unafordable or if restricted
	if (cost[i] > points) {
		values[i] = -infinity
	}
	if ((restrictions[i] - global.modEffects[15]) > global.wave) {
		values[i] = -infinity
	}
}

// spawns an enemy of type
enemies += 1
// max_array finds highest value in an array
var enemySpawned = max_array(values)
points -= cost[enemySpawned]
instance_create_depth(0, 0, 0, enemy_obj, {type : max_array(values), enemyNum : enemyNum})

enemyNum += 1

// sets chosen type to 0 points
values[enemySpawned] = 0

// speeds up spawnrate if fast forward
if (points > 0) {
	alarm[0] = max(ceil((60 * sqrt(cost[enemySpawned] / bias) / global.fastForward)) * global.modEffects[2] / global.modEffects[25] / max(sqrt(global.wave) / 3, 1), 1)
}
else {
	if (global.wave == global.stage * 2) {
		alarm[1] = max(ceil((60 * sqrt(cost[enemySpawned] / bias) / global.fastForward)) * global.modEffects[2] / global.modEffects[25] / max(1 + sqrt(global.wave) / 3, 1), 1)
	}
	else {
		endWave = true
		spawning = false
	}
}