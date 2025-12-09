image_alpha = 1

if (global.autostart) {
	image_index = 1
}

adjusting = false
goUp = true
alarmList = []

showDisplay = -1
frame = 0
shooting = false
logbookEntries = ["Gunner", "Sniper", "Railgunner", "Evaporator", "Boomer", "Flamer", "Puncher", "Laser", "Cheerleader", "Moneymaker", "Spotter", "Booster", "Commander", "Hacker", "Rapper", "Debt Collector"]
logbookDesc = [{title : "Gunner", desc : "Cheap, simple tower with consistent damage. \n$150 \n1 Damage \n0.5 sec Cooldown \n250 range \nUpgrade costs $75 >> $125 >> $200 >> $550", sprite : tower0_spr, spriteShooting : towerShooting0_spr},
	{title : "Sniper", desc : "Slightly more expensive tower with high damage and lower firerate. \n$325 \n7 Damage \n2 sec Cooldown \n500 range \nAutomatic camo detection \nUpgrade costs $125 >> $200 >> $325 >> $850", sprite : tower1_spr, spriteShooting : towerShooting1_spr},
	{title : "Railgunner", desc : "Expensive tower with very low firerate and very high damage. \n$1000 \n75 Damage \n5 sec Cooldown \n550 range \n20 Pierce \nAutomatic camo detection \nUpgrade costs $500 >> $825 >> $1300 >> $4800", sprite : tower2_spr, spriteShooting : towerShooting2_spr},
	{title : "Evaporator", desc : "Boss killer tower with aoe damage at higher levels, highest damage. \n$3750 \n1000 Damage \n10 sec Cooldown \n400 range \nHas invisible detection \nUpgrade costs $1750 >> $2750 >> $4500 >> $14000", sprite : tower3_spr, spriteShooting : towerShooting3_spr},
	{title : "Boomer", desc : "Low cost low damage aoe tower that fires quicker at later levels. \n$200 \n2 Damage \n1 sec Cooldown \n200 range \n10 Pierce \nCan hit solids \nUpgrade costs $100 >> $150 >> $275 >> $650", sprite : tower4_spr, spriteShooting : towerShooting4_spr},
	{title : "Flamer", desc : "Pricier tower that sets enemies on fire which turns them into sludge. \n$550 \n0.2 Damage \n0.5 sec Cooldown \n150 range \nCan hit solids \nSets enemies on fire that does 10 damage over 3.3 seconds \nUpgrade costs $275 >> $450 >> $725 >> $1500", sprite : tower5_spr, spriteShooting : towerShooting5_spr},
	{title : "Puncher", desc : "Pricier tower that hits multiple enemies with their swings for higher damage mutli target. \n$1000 \n5 Damage \n0.5 sec Cooldown \n5 Pierce \n100 range \nUpgrade costs $500 >> $825 >> $1325 >> $4250", sprite : tower6_spr, spriteShooting : towerShooting6_1_spr},
	{title : "Laser", desc : "Expensive tower that covers an entire line of the map to shred enemies. \n$5000 \n3 Damage \n0.2 sec Cooldown \n25 Pierce \nFires a continuous beam that doesn't rotate \nUpgrade costs $2500 >> $4150 >> $6500 >> $18000", sprite : tower7_spr}]