// initializes global variables
global.health = 100
global.wave = 1
global.money = 300
global.stage = 1
global.autostart = false
// for when starting a new wave
global.waveTransition = 0
// for when selecting a tower
global.upgradeMenu = false
global.fastForward = 1
global.paused = false
// for upgrades (dear god)
global.upgradeAmount = 1
global.availableTowers = [0, 1, 4, 8]
global.upgrades = [[], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
global.modifiers = []
// for specific upgrades
global.schizophrenics = []
global.lesbians = [-1, -1, -1, -1]
global.addictionBuyable = false
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

global.towerPool = [59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70]