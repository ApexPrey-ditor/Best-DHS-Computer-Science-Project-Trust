image_xscale = 0.3
image_yscale = 0.4

// initizles variables for enemies
burning = 0 
hp = 0
pathSpeed = 0

deactivated = false

alarmList = []

// enemy class (camo lead invisible)
class = [false, false, false]

// switches enemy costume based on type
image_index = type

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
		class = [true, false, false]
		break;
	case 5:
		// Solid
		hp = 10
		pathSpeed = 2
		class = [false, true, false]
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
	case 8:
		// Necromancer
		hp = 80
		pathSpeed = 2
		alarm[1] = 300
		break;
	case 9:
		// Nick's Girlfriend
		hp = 10
		pathSpeed = 4
		class = [false, false, true]
		break;
	case 10:
		// SUPERHATEYOUGIRL
		hp = 15
		pathSpeed = 6
		break;
	case 11:
		// butter
		hp = 5
		pathSpeed = 12
		break;
	case 12:
		// Group Castle 2 Spy
		hp = 20
		pathSpeed = 5
		class = [true, false, false]
		break;
	case 13:
		// Bob Crisscross
		hp = 160
		pathSpeed = 3
		break;
	case 14:
		// Titanium
		hp = 50
		pathSpeed = 2
		class = [false, true, false]
		break;
	case 15:
		// Knormle
		hp = 35
		pathSpeed = 4
		break;
	case 16:
		// Slim Shady
		hp = 10
		pathSpeed = 12
		class = [true, false, false]
		break;
	case 17:
		// The Real Slim Shady
		hp = 100
		pathSpeed = 10
		class = [true, false, false]
		break;
	case 18:
		// Gnecromancer
		hp = 400
		pathSpeed = 1
		alarm[1] = 420
		break;
	case 19:
		// Drazy Cave
		hp = 50
		pathSpeed = 13
		alarm[2] = 180
}

// sets how much money will give on death
cash = floor(hp * 1.5)

// go along the path at path speed
path_start(testPath, pathSpeed * global.fastForward, path_action_stop, true)
path_position = spath_sposition

// 
if (class[2] == true) {
	image_alpha = 0.3
}
