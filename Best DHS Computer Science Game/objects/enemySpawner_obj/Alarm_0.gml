for (var i = 0; i < array_length(weights); i++) {
	values[i] += weights[i] * min(cost[i] / bias, bias / cost[i])
	if (cost[i] > points) {
		values[i] = -infinity
	}
	if (restrictions[i] > global.wave) {
		values[i] = -infinity
	}
}

enemies += 1
points -= cost[max_array(values)]
instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : max_array(values)})

values[max_array(values)] = 0

if (points > 0) {
	alarm[0] = 60 / global.fastForward
}
else {
	endWave = true
}