// randomizes the seed
randomize()

// initializes global variables
global.health = 100
global.wave = 0
global.money = 30000
// for when starting a new wave
global.waveTransition = 0
// for when selecting a tower
global.upgradeMenu = false
global.fastForward = 1
global.paused = false
// if placing tower
placing = false

// stores alarms
alarmList = []

// page of tower UI and cost of towers
page = 0
costs = [150, 275, 1000, 3750, 200, 550, 1000, 5000, 850, 0, 0, 0, 0, 0, 0, 0]

// fullscreens
window_set_fullscreen(true)