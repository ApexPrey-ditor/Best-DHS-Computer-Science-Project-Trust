image_xscale = 0.3
image_yscale = 0.4

// initializes utility varibles
firing = false
placing = true
selected = false
attackRemainder = 0
targeting = "first"

// lists for general storage (making my life easier)
towerNames = ["Gunner", "Sniper", "Railgunner", "Evaporator", "Boomer", "Flamer", "Puncher", "Laser", "Cheerleader", "Moneymaker", "Spotter", "Booster", "Commander", "Hacker", "Rapper", "Debt Collecter"]
targetingTypes = ["First", "Last", "Strong", "Weak", "Farthest", "Closest"]
conditions = [function fireTargeting(value, check, priority) {
	if ((value.burning == 0 and check.burning == 0) or (value.burning != 0 and check.burning != 0)) {
		return 0 
	}
	else if ((value != 0 and check.burning == 0)) {
		return -power(5, priority)
	}
	else {
		return power(5, priority)
	}
}]

// alarm storage for pausing and fast forward
alarmList = []

// for buffs
firerateBuff = 1