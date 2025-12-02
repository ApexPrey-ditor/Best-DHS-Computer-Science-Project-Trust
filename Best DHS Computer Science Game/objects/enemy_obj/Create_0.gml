image_xscale = 0
image_yscale = 0

sprite_index = asset_get_index("enemy" + string(type) + "_spr")

// initizles variables for enemies
burning = 0 
hp = 0
pathSpeed = 0
damageResist = 1
weakness = 1
speedMulti = 1
phaseShift = false
skip = false
name = ""

effect = []
delays = []

deactivated = false

alarmList = []

// enemy class (camo lead invisible)
class = [false, false, false]

// switches enemy costume based on type
image_index = type

// sets stats based on enemy type
var bossHealths = []
var bossClass = []
switch (type) {
	case 0:
		// Normal
		hp = 5
		pathSpeed = 4
		name = "Normal"
		break;
	case 1:
		// Fast
		hp = 3
		pathSpeed = 6
		name = "Fast"
		break;
	case 2:
		// Tanky
		hp = 8
		pathSpeed = 2
		name = "Tanky"
		break;
	case 3:
		// Fanky
		hp = 7
		pathSpeed = 5
		name = "Fanky"
		break;
	case 4:
		// Camo
		hp = 4
		pathSpeed = 4
		class = [true, false, false]
		name = "Camo"
		break;
	case 5:
		// Solid
		hp = 10
		pathSpeed = 2
		class = [false, true, false]
		name = "Solid"
		break;
	case 6:
		// Gnormal
		hp = 12
		pathSpeed = 4
		name = "Gnormal"
		break;
	case 7:
		// JOB Ross
		hp = 80
		pathSpeed = 1.5
		name = "Job Ross"
		break;
	case 8:
		// Necromancer
		hp = 80
		pathSpeed = 2
		alarm[1] = ceil(300 / global.fastForward)
		name = "Necromancer"
		break;
	case 9:
		// Nick's Girlfriend
		hp = 10
		pathSpeed = 4
		class = [false, false, true]
		name = "Nick's Girlfriend"
		break;
	case 10:
		// SUPERHATEYOUGIRL
		hp = 15
		pathSpeed = 6
		name = "SUPERHATEYOUGIRL"
		break;
	case 11:
		// butter
		hp = 5
		pathSpeed = 12
		name = "Butter"
		break;
	case 12:
		// Group Castle 2 Spy
		hp = 20
		pathSpeed = 5
		class = [true, false, false]
		name = "Group Castle 2 Spy"
		break;
	case 13:
		// Bob Crisscross
		hp = 160
		pathSpeed = 3
		name = "Bob Crisscross"
		break;
	case 14:
		// Titanium
		hp = 50
		pathSpeed = 2
		class = [false, true, false]
		name = "Titanium"
		break;
	case 15:
		// Knormle
		hp = 35
		pathSpeed = 4
		name = "Knormle"
		break;
	case 16:
		// Slim Shady
		hp = 10
		pathSpeed = 12
		class = [true, false, false]
		name = "Slim Shady"
		break;
	case 17:
		// The Real Slim Shady
		hp = 100
		pathSpeed = 10
		class = [true, false, false]
		name = "The Real Slim Shady"
		break;
	case 18:
		// Gnecromancer
		hp = 400
		pathSpeed = 1
		alarm[1] = ceil(420 / global.fastForward)
		name = "Gnecromancer"
		break;
	case 19:
		// Drazy Cave
		hesCrazy = 0
		hp = 50
		pathSpeed = 10
		alarm[1] = 1
		name = "Drazy Cave"
		break;
	case 20:
		// John Cena
		hp = 75
		pathSpeed = 8
		class = [false, false, true]
		name = "John Cena"
		break;
	case 21:
		// 10" Tungsten Cube
		hp = 3500
		pathSpeed = 1
		class = [false, true, false]
		name = "10\" Tungsten Cube"
		break;
	case 22:
		// Not Quite As Evil Girl But Still Certainly Devious
		hp = 150
		pathSpeed = 4
		name = "Not Quite As Evil Girl But Still Certainly Devious"
		break;
	case 23:
		// DPS Check
		hp = 100
		pathSpeed = 8
		name = "DPS Check"
		break;
	case 24:
		// Glob Moss
		hp = 640
		pathSpeed = 6
		name = "Glob Moss"
		break;
	case 25:
		// Necrowomancer
		hp = 700
		pathSpeed = 2
		alarm[1] = ceil(420 / global.fastForward)
		name = "Necrowomancer"
		break;
	case 26:
		// You Have Just Lost The Game
		hp = 150
		pathSpeed = 5
		class = [true, true, true]
		name = "You Have Just Lost The Game"
		break;
	case 27:
		// Most Indubitably Greater In Quantity And Quality Of Evil And Deviousness Than "Not Quite As Evil Girl But Still Certainly Devious" Which Can Be Observed When Being Pitted Against One Another But Definitely Not Quite As Magnificently Malevolent Or Devious When Compared And Contrasted To "Evil Girl" Yet Despite This Comparison Still Containing And Representing A Great Amount Of Evil And/Or Deviousness Girl
		hp = 5000
		pathSpeed = 3
		name = "Most Indubitably Greater In Quantity And Quality Of Evil And Deviousness Than \"Not Quite As Evil Girl But Still Certainly Devious\" Which Can Be Observed When Being Pitted Against One Another But Definitely Not Quite As Magnificently Malevolent Or Devious When Compared And Contrasted To \"Evil Girl\" Yet Despite This Comparison Still Containing And Representing A Great Amount Of Evil And/Or Deviousness Girl"
		break;
	case 28:
		// Final Foss
		hp = 25 * global.modEffects[21]
		pathSpeed = 2
		name = "Final Foss"
		break;
	case 29:
		// Negative Nancy
		bossHealths = [67, 100, 167, 200]
		hp = bossHealths[global.stage - 2] * global.modEffects[21]
		pathSpeed = 2
		name = "Negative Nancy"
		break;
	case 30:
		// Ferocious Female
		bossHealths = [175, 250, 275, 325, 359]
		bossClass = [[false, false, false], [false, false, false], [true, false, false], [true, false, false], [false, false, true]]
		hp = bossHealths[global.stage - 6] * global.modEffects[21]
		class = bossClass[global.stage - 6]
		pathSpeed = 5
		name = "Ferocious Female"
		break;
	case 31:
		// Destructive Damsel
		bossHealths = [750, 1250, 2000, 3000, 4500]
		hp = bossHealths[global.stage - 11] * global.modEffects[21]
		class = [false, true, false]
		pathSpeed = 2
		name = "Destructive Damsel"
		break;
	case 32:
		// Malicious Madam
		bossHealths = [5000, 6000, 7500]
		bossClass = [[false, false, false], [true, false, false], [false, false, true]]
		hp = bossHealths[global.stage - 16] * global.modEffects[21]
		pathSpeed = 3
		name = "Malicious Madam"
		break;
	case 33:
		// Your Mom
		hp = 20000 * global.modEffects[21]
		pathSpeed = 1
		name = "Ur Mom"
		break;
	case 34:
		// Evil Girl
		hp = 75000 * global.modEffects[21]
		pathSpeed = 1
		name = "Evil Girl"
		break;
}

// aplies modifiers
hp = ceil(hp * global.modEffects[0] * global.modEffects[3])
pathSpeed = pathSpeed * global.modEffects[4] / global.modEffects[1]
damageResist += global.modEffects[19]
if (global.permClass[0]) {
	class[0] = global.permClass[0]
}
if (global.permClass[1]) {
	class[1] = global.permClass[1]
}
if (global.scitzo and (class[0] or class[1])) {
	class[2] = true
}

// sets how much money will give on death
cash = hp

maps = [meadow, threeRoundsDown, evilGirlInvaders, theDreamTeam, infinite, intermission, doubleOrNothing, baitNSwitch, meadow2, flooding, girlsVsEvilGirls]
paths = [[meadowPath], [threeRoundsDownPath], [evilGirlInvadersPath], [theDreamTeamPath], [infinitePath], [intermissionPath], [doubleOrNothingPath1, doubleOrNothingPath2], [baitNSwitchPath1, baitNSwitchPath2], [meadow2Path], [floodingPath], [girlsVsEvilGirlsPath1, girlsVsEvilGirlsPath2, girlsVsEvilGirlsPath3, girlsVsEvilGirlsPath4, girlsVsEvilGirlsPath5]]

// go along the path at path speed
if (room != baitNSwitch) {
	path_start(paths[array_get_index(maps, room)][enemyNum % array_length(paths[array_get_index(maps, room)])], pathSpeed * global.fastForward, path_action_stop, true)
}
else {
	path_start(paths[array_get_index(maps, room)][global.wave % array_length(paths[array_get_index(maps, room)])], pathSpeed * global.fastForward, path_action_stop, true)
}
path_position = spath_sposition
 
image_alpha = global.modEffects[12]
 
if (class[2] == true) {
	image_alpha -= 0.7
}
