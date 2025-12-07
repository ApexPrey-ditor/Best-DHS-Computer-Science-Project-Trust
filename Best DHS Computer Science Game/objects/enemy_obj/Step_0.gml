// reduces health and deletes enemy when reaching the end of path
if (path_position == 1 and not deactivated) {
	global.health -= ceil(hp)
	skip = true
	instance_destroy()
}

// increases speed if the fast forward is activated
path_speed = pathSpeed * global.fastForward * speedMulti

// destroys the enemy instance when its health goes below 0
if (hp <= 0 and not deactivated) {
	instance_destroy()
}

// stops enemies if it's paused
if (global.paused) {
	path_speed = 0
}
else {
	// reduces health if the enemy is burning
	hp -= burning * global.fastForward
	// heals hp if can regenerate
	if (image_index == 23) {
		hp += 10 / 6
	}
	hp += global.modEffects[13] * power(global.wave, 2) / 60
	
	if (hp > cash) {
		hp = cash
	}
	
	if (hp <= cash / 2 and not phaseShift) {
		phaseShift = true
		
		pathSpeed = pathSpeed * global.modEffects[17]
		damageResist = damageResist * global.modEffects[18]
	}
	
	for (var i = 0; i < array_length(effect); i++) {
		delays[i] -= global.fastForward
		if (delays[i] <= 0) {
			for (var w = 0; w < array_length(effect[i]); w++) {
				switch (w) {
					case 0:
						hp -= effect[i][w]
						break;
					case 1:
						burning = effect[i][w]
						if (effect[i][w] > 0) {
							image_blend = c_orange
						}
						break;
					case 2:
						alarm[0] = effect[i][w]
						break;
					case 3:
						speedMulti = effect[i][w]
						break;
					case 4:
						if (effect[i][w] == 0) {
							image_speed = 0
						}
						alarm[2] = effect[i][w]
						break;
					case 5:
						if (effect[i][w]) {
							class[0] = false
						}
						break;
				}
			}
			array_delete(delays, i, 1)
			array_delete(effect, i, 1)
			i -= 1
		}
	}
	
	if (path_index != -1) {
		if (x > path_get_x(path_index, path_position - (path_speed / path_get_length(path_index)))) {
			image_xscale = abs(image_xscale)
		}
		if (x < path_get_x(path_index, path_position - (path_speed / path_get_length(path_index)))) {
			image_xscale = -abs(image_xscale)
		}
		if (path_get_length(path_index) - (path_get_length(path_index) * path_position)) / path_speed <= 20 / global.fastForward {
			if (image_yscale > 0) {
				image_xscale -= (0.4 / 20) * global.fastForward * pos_neg(image_xscale)
				image_yscale -= (0.4 / 20) * global.fastForward
			}
		}
		else if (abs(image_xscale) < 0.4) {
			image_xscale += (0.4 / 20) * global.fastForward * pos_neg(image_xscale)
			image_yscale += (0.4 / 20) * global.fastForward
		}
	}
}

image_speed = sign(image_speed) * global.fastForward
depth = -y