image_xscale = 0.3
image_yscale = 0.4

burning = 0 
hp = 0
pathSpeed = 0


switch (type) {
	case 0:
		hp = 5
		pathSpeed = 4
		break;
	case 1:
		hp = 3
		pathSpeed = 6
		break;
	case 2:
		hp = 10
		pathSpeed = 3
		break;
}

cash = floor(hp * 1.5)

// go along the path at path speed
path_start(testPath, pathSpeed * global.fastForward, path_action_stop, true)