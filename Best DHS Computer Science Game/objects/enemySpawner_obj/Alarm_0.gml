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

if (points < ceil((power(1.1935, global.wave) + 5 * global.wave + 10) * global.modEffects[9]) / 4 and global.wave == global.stage * 2 and audio_group_get_gain(Music) == 1) {
	audio_group_set_gain(Music, 0, 1000)
	audio_group_set_gain(MusicCalm, 0, 1000)
}

// speeds up spawnrate if fast forward
if (points > 0) {
	alarm[0] = max(ceil((60 * sqrt(cost[enemySpawned] / bias) / global.fastForward)) * global.modEffects[2], 1)
}
else {
	if (global.wave == global.stage * 2) {
		audio_group_set_gain(MusicBosses, 1, 0)
		
		if (global.stage == 1) {
			audio_play_sound(finalFraud, 1, true)
			alarm[1] = 30
		}
		else if (global.stage < 6) {
			audio_play_sound(msNegativity, 1, true)
			alarm[1] = 30
		}
		else if (global.stage < 11) {
			alarm[1] = 30
		}
		else if (global.stage < 16) {
			alarm[1] = 30
		}
		else if (global.stage < 19) {
			alarm[1] = 30
		}
		if (global.stage == 19) {
			alarm[1] = 30
		}
		if (global.stage == 20) {
			alarm[1] = 30
		}
	}
	else {
		endWave = true
		spawning = false
	}
}