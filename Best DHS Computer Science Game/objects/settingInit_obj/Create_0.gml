// randomizes the seed
randomize()

gml_pragma("MarkTagAsUsed", "show")

// make particle system
main_ps = part_system_create()

//Set up for Flamethrower
flameType = part_type_create()

part_type_shape(flameType, pt_shape_flare)
part_type_scale(flameType, 1, 1)
part_type_size(flameType, 1, 1, -0.003, 0)


part_type_speed(flameType, 5, 6, -0.07, 0.5)
part_type_gravity(flameType, 0, 0)
part_type_direction(flameType, 75, 105, 0, 0.5)
part_type_orientation(flameType, 0, 0, 0, 0, false)

part_type_life(flameType, 80, 80)

part_type_color3(flameType, make_color_rgb(255, 67, 0), make_color_rgb(255, 238, 96), make_color_rgb(255, 255, 255))
part_type_blend(flameType, true)
part_type_alpha1(flameType, 1)

// initializes global variables
global.health = 100
global.wave = 1
global.money = 300
global.stage = 1
// for when starting a new wave
global.waveTransition = 0
// for when selecting a tower
global.upgradeMenu = false
global.fastForward = 1
global.paused = false
// for upgrades (dear god)
global.upgrades = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
// for testing t4s
repeat (2) {
	array_push(global.upgrades[11], {display : "+Ammunition", desc : "+|% Reload Speed", buff : 5})
}
global.modifiers = []
// for specific upgrades
global.schizophrenics = []
// modifier rolls
global.modifierPool = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
// modifier effect (enemy health TW, enemy speed TW, enemy spawn rate, enemy health, enemy speed, starting cash, EOR Bonus, E cash, starting lives, points multi, tower size, upgrade cost, E opacity, E regen, modif effects, E spawn wave, tower cap, phase effect speed, phase effect resist, damage resist, bonus stages, boss health)
global.modEffects = [1, 1, 1, 1, 1, 300, 1, 1, 100, 1, 1, 1, 1, 0, 1, 0, infinity, 1, 1, 0, 0, 1]
// for specific modifs
global.scitzo = false
global.permClass = [false, false, false]
global.fool = false
global.first = true
global.towers = 0
global.entrepreneurs = -1
// for modifs (damage, firerate, range, effect, AOE, pierce)
global.towerStats = [1, 1, 1, 1, 1, 1]
// detection giving cards
global.oneTimesKey = [3, 4, 6, 10, 18, 19, 26]
global.oneTimesValues = [[0, 2, 3, 4, 5, 6, 14],
						[0, 1, 2, 3, 6, 14],
						[0, 1, 2, 4, 5, 6, 12],
						[0, 1, 2, 3],
						[4, 5, 6, 7],
						[4, 6, 7],
						[4, 5]]

global.upgradePool = []
// cards for debugging
repeat (1000) {
	array_push(global.upgradePool, 46)
}
// Not Ferdigalocious
repeat (6) {
}
// Not Good
repeat (5) {	
}
// Not Okay
repeat (4) {
	array_push(global.upgradePool, 0) // Weapons Funding
	array_push(global.upgradePool, 1) // +Ammunition
	array_push(global.upgradePool, 2) // Larger Lenses
	array_push(global.upgradePool, 3) // Personal Spotter
	array_push(global.upgradePool, 4) // Piercing Rounds
	array_push(global.upgradePool, 5) // Hype
}
// Not Bad
repeat (3) {	
	array_push(global.upgradePool, 6) // Scitzo
	array_push(global.upgradePool, 7) // Lose Yourself
	array_push(global.upgradePool, 8) // gdrrrrrrrrrrr brrrrrrrrrrat brrrrrrrrrat brrrrrrrrrrrrrrrrrrrrrrrrrrr wrrrrrrrrrrrrrrrrriririirir
	array_push(global.upgradePool, 9) // Triangle Bullet
	array_push(global.upgradePool, 10) // HELP IT BURNS
	array_push(global.upgradePool, 11) // Thicc Bullets
	array_push(global.upgradePool, 13) // Sodium Hydrogen Oxygen Malevolent Bond
	array_push(global.upgradePool, 14) // Oxygen Helium Ignition Ornament
	array_push(global.upgradePool, 15) // Tungsten Ultimate Nitrogen Gun
	array_push(global.upgradePool, 16) // GO TO HELL
	array_push(global.upgradePool, 17) // Pentaerythritol Tetranitrate
	array_push(global.upgradePool, 18) // worlds brightest flashlight
	array_push(global.upgradePool, 19) // hydrogen
	array_push(global.upgradePool, 20) // Hey Guys I Think There's a Fly Biting Me
	array_push(global.upgradePool, 21) // Whats a Physics?
	array_push(global.upgradePool, 22) // A Litteraly Mini Nuke
	array_push(global.upgradePool, 23) // sharp explosions
	array_push(global.upgradePool, 24) // (the) Radiance
	array_push(global.upgradePool, 25) // DESTROY
	array_push(global.upgradePool, 26) // bro im lagging i swaer
	array_push(global.upgradePool, 42) // Psychiatrist
	array_push(global.upgradePool, 43) // eyes on the prize
	array_push(global.upgradePool, 44) // pocketer
	array_push(global.upgradePool, 45) // big eyes
	array_push(global.upgradePool, 46) // i dont have very many beans so you guys are gonna have to share
	array_push(global.upgradePool, 47) // chinese sweatshop conditions
	array_push(global.upgradePool, 49) // Bind
}
// Not Horrible
repeat (2) {	
	array_push(global.upgradePool, 52) // JOTE
	array_push(global.upgradePool, 53) // You don't know JACK
	array_push(global.upgradePool, 54) // Teh 11 of Spades
	array_push(global.upgradePool, 55) // BEEG GUNZ
	array_push(global.upgradePool, 56) // beer
	array_push(global.upgradePool, 56) // JOAHTE
}
//Not Morbinacious

// if placing tower
placing = false

// stores alarms
alarmList = []

// page of tower UI and cost of towers
page = 0
costs = [150, 275, 1000, 3750, 200, 550, 1000, 5000, 850, 700, 3500, 4000, 4000, 3750, 3500, 3000]

// variables for making the radar work
radarDir = 0
prevBlip = [210, 0, 0]
//nextBlip = [30, 496, 0]
nextBlip = [30, 30, 0]
selection = 0

// fullscreens
window_set_fullscreen(true)