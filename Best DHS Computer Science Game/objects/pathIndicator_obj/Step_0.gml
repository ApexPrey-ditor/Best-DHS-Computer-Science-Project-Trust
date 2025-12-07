if (enemySpawner_obj.enemies > 0 or image_alpha != 0.5) {
	image_alpha -= 1/120
}

if (image_alpha <= 0) {
	instance_destroy()
}

if (global.paused) {
	path_speed = 0
	image_speed = 0
}
else {
	path_speed = 25
	image_speed = 1
	if (path_get_length(path_index) - (path_get_length(path_index) * path_position)) / path_speed <= 20 {
		if (image_yscale > 0) {
			image_xscale -= (0.4 / 20) * pos_neg(image_xscale)
			image_yscale -= (0.4 / 20)
		}
	}
	else if (abs(image_xscale) < 0.4) {
		image_xscale += (0.4 / 20) * pos_neg(image_xscale)
		image_yscale += (0.4 / 20)
	}
	
	if (x > path_get_x(path_index, path_position - (path_speed / path_get_length(path_index)))) {
		image_xscale = abs(image_xscale)
	}
	if (x < path_get_x(path_index, path_position - (path_speed / path_get_length(path_index)))) {
		image_xscale = -abs(image_xscale)
	}
}