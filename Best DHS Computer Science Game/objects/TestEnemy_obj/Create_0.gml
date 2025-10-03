image_xscale = 0.3
image_yscale = 0.4

// initizles variables for enemies
burning = 0 
hp = 0
pathSpeed = 0

deactivated = false

alarmList = []

// sets stats based on enemy type
switch (type) {
	case 0:
		// Normal
		hp = 5
		pathSpeed = 4
		break;
	case 1:
		// Fast
		hp = 3
		pathSpeed = 6
		break;
	case 2:
		// Tanky
		hp = 8
		pathSpeed = 2
		break;
	case 3:
		// Fanky
		hp = 7
		pathSpeed = 5
		break;
	case 4:
		// Camo
		hp = 4
		pathSpeed = 4
		// camo variable = true
		break;
	case 5:
		// Solid
		hp = 10
		pathSpeed = 2
		// lead variable = true
		break;
	case 6:
		// Gnormal
		hp = 12
		pathSpeed = 4
		break;
	case 7:
		// JOB Ross
		hp = 80
		pathSpeed = 1.5
		break;
}

// sets how much money will give on death
cash = floor(hp * 1.5)

// go along the path at path speed
path_start(testPath, pathSpeed * global.fastForward, path_action_stop, true)