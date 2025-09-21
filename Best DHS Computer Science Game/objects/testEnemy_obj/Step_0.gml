// reduces health and deletes enemy when reaching the end of path
if path_position == 1 {
	global.health -= hp
	instance_destroy()
}