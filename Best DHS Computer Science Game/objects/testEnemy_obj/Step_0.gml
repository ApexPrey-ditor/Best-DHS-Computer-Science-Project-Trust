// reduces health and deletes enemy when reaching the end of path
if path_position == 1 {
	global.health -= hp
	instance_destroy()
}

hp -= burning * global.fastForward

path_speed = pathSpeed * global.fastForward

if hp < 0 {
	instance_destroy()
}