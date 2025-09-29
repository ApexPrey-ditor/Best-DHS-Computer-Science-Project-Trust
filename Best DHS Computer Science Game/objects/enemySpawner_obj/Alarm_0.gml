// iterates through all enemy spawns
for (var i = 0; i < array_length(weights); i++) {
	// adds "points" based on weights and distance form desired cost
	values[i] += weights[i] * min(cost[i] / bias, bias / cost[i])
	// disables enemy if unafordable or if restricted
	if (cost[i] > points) {
		values[i] = -infinity
	}
	if (restrictions[i] > global.wave) {
		values[i] = -infinity
	}
}

// spawns an enemy of type
enemies += 1
// max_array finds highest value in an array
var enemySpawned = max_array(values)
points -= cost[enemySpawned]
instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : max_array(values)})

// sets chosen type to 0 points
values[enemySpawned] = 0

// speeds up spawnrate if fast forward
if (points > 0) {
	alarm[0] = ceil((60 * sqrt(cost[enemySpawned] / bias)) / global.fastForward)
}
else {
	endWave = true
}