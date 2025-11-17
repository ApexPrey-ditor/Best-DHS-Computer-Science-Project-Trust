// initializes global variables
global.health = 100
//global.wave = floor(global.stage / 2) + 1
global.wave = floor(global.stage) * 2
global.money = 30000
for (var i = 0; i < global.wave; i++) {
	global.money += 50 + i * 50
}
// for when starting a new wave
global.waveTransition = 0
// for when selecting a tower
global.upgradeMenu = false

selection = 0

if (irandom_range(0, 1) == 0) {
	nextBlip = [irandom_range(0, 22) * 2, 496, 0]
	prevBlip = [nextBlip[0] + 180, 0, 0]
}
else {
	nextBlip = [irandom_range(158, 178) * 2, 496, 0]
	prevBlip = [nextBlip[0] - 180, 0, 0]
}