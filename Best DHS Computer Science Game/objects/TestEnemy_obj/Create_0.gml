image_xscale = 0.3
image_yscale = 0.4

// initizles variables for enemies
burning = 0 
hp = 0
pathSpeed = 0

alarmList = []

// sets stats based on enemy type
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

// sets how much money will give on death
cash = floor(hp * 1.5)

// go along the path at path speed
path_start(testPath, pathSpeed * global.fastForward, path_action_stop, true)