// reduces health and deletes enemy when reaching the end of path
if (path_position == 1 and not deactivated) {
	global.health -= ceil(hp)
	instance_destroy()
}

// reduces health if the enemy is burning
hp -= burning * global.fastForward

// increases speed if the fast forward is activated
path_speed = pathSpeed * global.fastForward

// destroys the enemy instance when its health goes below 0
if (hp <= 0 and not deactivated) {
	instance_destroy()
}

// stops enemies if it's paused
if (global.paused) {
	path_speed = 0
}