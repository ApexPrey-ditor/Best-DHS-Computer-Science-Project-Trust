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
}

depth = -y