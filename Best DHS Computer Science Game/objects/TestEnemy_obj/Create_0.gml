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
		hesCrazy = 0
		hp = 50
		pathSpeed = 10
		alarm[1] = 1
		break;
	case 20:
		// John Cena
		hp = 75
		pathSpeed = 8
		class = [false, false, true]
		break;
	case 21:
		// 10" Tungsten Cube
		hp = 3500
		pathSpeed = 1
		class = [false, true, false]
		break;
	case 22:
		// Not Quite As Evil Girl But Still Certainly Devious
		hp = 150
		pathSpeed = 4
		break;
	case 23:
		// DPS Check
		hp = 100
		pathSpeed = 8
		alarm[1] = 60
		break;
	case 24:
		// Glob Moss
		hp = 640
		pathSpeed = 6
		break;
	case 25:
		// Necrowomancer
		hp = 700
		pathSpeed = 2
		alarm[1] = 420
		break;
	case 26:
		// You Have Just Lost The Game
		hp = 150
		pathSpeed = 5
		class = [true, true, true]
		break;
	case 27:
		// Most Indubitably Greater In Quantity And Quality Of Evil And Deviousness Than "Not Quite As Evil Girl But Still Certainly Devious" Which Can Be Observed When Being Pitted Against One Another But Definitely Not Quite As Magnificently Malevolent Or Devious When Compared And Contrasted To "Evil Girl" Yet Despite This Comparison Still Containing And Representing A Great Amount Of Evil And/Or Deviousness Girl
		hp = 5000
		pathSpeed = 3
		break;
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
