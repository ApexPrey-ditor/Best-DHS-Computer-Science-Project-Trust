image_xscale = 0.4 * global.modEffects[10]
image_yscale = 0.4 * global.modEffects[10]

sprite_index = asset_get_index("tower" + string(towerType) + "_spr")
show_debug_message("tower" + string(towerType) + "_spr")

// initializes utility varibles
firing = false
placing = true
selected = false
targetingSelection = false
attackRemainder = 0
if (special == "s commander") {
	targeting = "Carpet Bombing"
}
else {
	targeting = "First"
}
specialTargeting = "None"
targeting2 = "First"
specialTargeting2 = "None"
particles = []
finalPositions = []
drawPercents = []
targetable = ds_list_create()
follows = []
bounce = 0
lifeDeduct = 0
delay = 0
level = 1
kills = 0
puncherAlt = "2"
decamo = false
shotNum = 0
lead = true
tier4 = false
psychiatrist = 0

// firing conditions
// initial is the current target enemy
// check is the comparing enemy
function firstTargeting(array, initial, check, priority) {
	// if check is further in the path, adds points
	if check < initial {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function lastTargeting(array, initial, check, priority) {
	// if check is further back along the path, adds points
	if check > initial {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function strongTargeting(array, initial, check, priority) {
	// if check has more hp, adds points
	if (ds_list_find_value(array, check).hp > ds_list_find_value(array, initial).hp) {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function weakTargeting(array, initial, check, priority) {
	// if check has less hp, adds points
	if (ds_list_find_value(array, check).hp < ds_list_find_value(array, initial).hp) {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function closeTargeting(array, initial, check, priority) {
	// if check is closer, adds points
	if (distance_to_object(ds_list_find_value(array, check)) < distance_to_object(ds_list_find_value(array, initial))) {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function farTargeting(array, initial, check, priority) {
	// if check is further, adds points
	if (distance_to_object(ds_list_find_value(array, check)) > distance_to_object(ds_list_find_value(array, initial))) {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function fireTargeting(array, initial, check, priority) {
	// if check and initial have the same status, does nothing
	if ((ds_list_find_value(array, check).burning == 0 and ds_list_find_value(array, initial).burning == 0) or (ds_list_find_value(array, check).burning != 0 and ds_list_find_value(array, initial).burning != 0)) {
		return 0
	}
	// if check is burning while initial isn't, give points
	else if ((ds_list_find_value(array, check).burning == 0 and ds_list_find_value(array, initial).burning != 0)) {
		return power(1/2, priority)
	}
	else {
		return -power(1/2, priority)
	}
}
function noneTargeting(array, initial, check, priority) {
	return 0
}

// lists for general storage (making my life easier)
towerNames = ["Gunner", "Sniper", "Railgunner", "Evaporator", "Boomer", "Flamer", "Puncher", "Laser", "Cheerleader", "Moneymaker", "Spotter", "Booster", "Commander", "Hacker", "Rapper", "Debt Collecter"]
towerNamesT4 = ["Soldier", "Assassin", "Gauss Machine Gun", "Dissapator", "Grenadier", "Pyromaniac", "Heavyweight", "Tachyon Beam", "Captain", "Entrepreneur", "Marker", "Overclocker", "General", "Cyberpunk", "Lyrical Miracle"]

targetingTypes = ["First", "Last", "Strong", "Weak", "Farthest", "Closest"]
targetingTranslations = [firstTargeting, lastTargeting, strongTargeting, weakTargeting, farTargeting, closeTargeting]

specialTypes = ["None", "Non-burning"]
specialTranslations = [noneTargeting, fireTargeting]

// for targeting type conditions
conditions = []
conditions2 = [firstTargeting, noneTargeting]

// alarm storage for pausing and fast forward
alarmList = []

// for buffs (cheerleader firerate, spotter damage, spotter range, camo, booster damage, commander firerate, hacker discount)
buffs = [1, 1, 1, false, 1, 1, 0]
// for upgrades (damage, firerate, range, effect, AOE, pierce)
multis = []
array_copy(multis, 0, global.towerStats, 0, array_length(global.towerStats))
// Upgrade Costs
costs = [[75, 125, 200, 550, 100], [125, 200, 325, 850, 150], [500, 825, 1300, 4800, 675], [1750, 2750, 4500, 14000, 2325], [100, 150, 275, 650, 150], [275, 450, 725, 1500, 350], [500, 825, 1325, 4250, 675], [2500, 4150, 6500, 18000, 3325], [425, 700, 1125, 2000, 550], [350, 575, 925, 1800, 450], [1750, 2850, 4500, 10000, 2325], [2000, 3250, 5350, 10000, 2650], [2000, 3250, 5250, 15000, 2650], [1875, 3125, 5000, 8000, 2500], [1750, 2900, 4650, 1000, 2325]]
// upgrade effectiveness
effectiveness = [0.5, 1, 2]
// what tower is being buffed (for booster)
buffing = noone

if (special == "flame") {
	specialTargeting = "Non-burning"
	array_push(conditions, fireTargeting)
}
else {
	array_push(conditions, noneTargeting)
}

array_push(conditions, firstTargeting)