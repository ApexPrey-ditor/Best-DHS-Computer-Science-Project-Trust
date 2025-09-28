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
points -= cost[max_array(values)]
instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : max_array(values)})

// sets chosen type to 0 points
values[max_array(values)] = 0

// speeds up spawnrate if fast forward
if (points > 0) {
	alarm[0] = 60 / global.fastForward
}
else {
	endWave = true
}