image_xscale = 0.3
image_yscale = 0.4

// initializes utility varibles
firing = false
placing = true
selected = false
attackRemainder = 0
targeting = "First"
specialTargeting = "None"
particles = []
finalPositions = []
drawPercents = []

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
		return -power(1/2, priority)
	}
	else {
		return power(1/2, priority)
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

// lists for general storage (making my life easier)
towerNames = ["Gunner", "Sniper", "Railgunner", "Evaporator", "Boomer", "Flamer", "Puncher", "Laser", "Cheerleader", "Moneymaker", "Spotter", "Booster", "Commander", "Hacker", "Rapper", "Debt Collecter"]
targetingTypes = ["First", "Last", "Strong", "Weak", "Farthest", "Closest"]
targetingTranslations = [firstTargeting, lastTargeting, strongTargeting, weakTargeting, closeTargeting, farTargeting]

// for targeting type conditions
conditions = []

// alarm storage for pausing and fast forward
alarmList = []

// for buffs
firerateBuff = 1

if (special == "flame") {
	array_push(conditions, fireTargeting)
}

array_push(conditions, firstTargeting)