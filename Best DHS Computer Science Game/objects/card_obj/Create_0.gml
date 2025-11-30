direction = -90

function find_camo_unique(element, index) {
	return not array_contains(global.oneTimesValues[0], element)
}

pickable = false
selecting = false
dissapate = false

effectiveness = [0.5, 1, 2]

repeatable = false
oneTime = false
tier4 = false
appliable = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
replace = []
stats = {}

// ALL THE UPGRADES
switch (image_index) {
	// Weapons Funding
	case 0:
		stats = {display : "Weapons Funding", desc : "+|% Damage", damage : 0.25}
		replace = [25]
		appliable = [0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14]
		repeatable = false
		break;
	// +Ammunition
	case 1:
		stats = {display : "+Ammunition", desc : "+|% Reload Speed", fireSpeed : 0.2}
		replace = [20]
		appliable = [0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14]
		repeatable = false
		break;
	// Larger Lenses
	case 2:
		stats = {display : "Larger Lenses", desc : "+|% Range", range : 0.35}
		replace = [35]
		appliable = [0, 1, 2, 3, 4, 5, 6, 8, 10, 11, 13, 14]
		repeatable = false
		break;
	// Personal Spotter
	case 3:
		stats = {display : "Personal Spotter", desc : "Gives camo detection", d0 : true}
		appliable = global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]
		repeatable = false
		oneTime = true
		break;
	// Piercing Rounds
	case 4:
		stats = {display : "Piercing Rounds", desc : "Gives lead hitting", d1 : true}
		appliable = global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]
		repeatable = false
		oneTime = true
		break;
	// Hype
	case 5:
		stats = {display : "Hype", desc : "+|% Effect Power", buff : 0.25}
		replace = [25]
		appliable = [8, 9, 10, 11, 12, 13, 14]
		repeatable = false
		break;
	// Scitzo
	case 6:
		stats = {display : "Schizophrenic", desc : "Gives invisibility detection", d2 : true}
		appliable = global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]
		repeatable = false
		oneTime = true
		break;
	// Lose Yourself
	case 7:
		stats = {display : "Lose Yourself", desc : "\"His palms are palms, palms weak, arms are palms, there's palms on his palms already, mom's palms.\" \n+|% Damage\n -|% Fire Rate", damage : 1, fireSpeed : -0.45}
		replace = [100, 45]
		appliable = [0, 1, 2, 3, 14]
		repeatable = false
		break;
	// gdrrrrrrrrrrr brrrrrrrrrrat brrrrrrrrrat brrrrrrrrrrrrrrrrrrrrrrrrrrr wrrrrrrrrrrrrrrrrriririirir
	case 8:
		stats = {display : "gdrrrrrrrrrrr brrrrrrrrrrat brrrrrrrrrat brrrrrrrrrrrrrrrrrrrrrrrrrrr wrrrrrrrrrrrrrrrrriririirir", desc : "\"We attached a car to your gun\" \n+|% Fire Rate\n-|% damage", damage : -0.5, fireSpeed : 1}
		replace = [100, 50]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// Triangle Bullet
	case 9:
		stats = {display : "Triangle Bullet", desc : "\"Hey why didn't we do this earlier?\" \n+| Pierce", pierceL : 2}
		replace = [2]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// HELP IT BURNS
	case 10:
		stats = {display : "HELP IT BURNS", desc : "\"Im writing this describtion on october 31 at 12:46 pm in 2025 on the Trello description of this card, but i started writing it at 12:45, so this took at least 1 second if the time was 12:45:59 when i started writting\" \nAttacks burn enemies", burn : true}
		appliable = global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]
		repeatable = false
		oneTime = true
		break;
	// Thicc Bullets
	case 11:
		stats = {display : "Thicc Bullets", desc : "\"think fast chucklenuts OUIAAAAAAAAAAAAAAAAAAAAAAAA\" \n-|% attack speed\nStuns enemies for (damage / enemy hp) * | seconds", fireSpeed : -0.6, stun : 2}
		replace = [60, 2]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// Bouncing Shot
	case 12:
		stats = {display : "Bouncing Shot", desc : "\"how did i get an A in style the world hates me\" \n+| bullet bounces \n-|% damage", damage : -0.2, bounce : 2}
		replace = [2, 20]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// Sodium Hydrogen Oxygen Malevolent Bond
	case 13:
		stats = {display : "Sodium Hydrogen Oxygen Malevolent Bond", desc : "\"the shomb aoe bullets that increase the epic aoe of the epic single epic targ epic epic rs\" \n+| Pierce+ \n+|% damage", pierceL : 1, damage : 0.15}
		replace = [1, 15]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// Oxygen Helium Ignition Ornament
	case 14:
		stats = {display : "Sodium Hydrogen Oxygen Malevolent Bond", desc : "\"why is it ignition if its not igniting anything are you stupid\" \n Sets things on cold", slow : 1}
		replace = [1, 15]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// Oxygen Helium Ignition Ornament
	case 15:
		stats = {display : "Tungsten Ultimate Nitrogen Gun", desc : "\"this was IMPORTED ITALIAN MAPLE\" \n +| pierce \n -|% attack speed", pierceL : 5, fireSpeed : -0.67}
		replace = [5, 67]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// GO TO HELL
	case 16:
		stats = {display : "GO TO HELL", desc : "\"this is literally evangelion!\" \n-| life per shot \n+|% damage \n+|% reload speed \n+| pierce", damage : 1, fireSpeed : 1, pierceL : 5, lifeDeduct : 1}
		replace = [1, 100, 100, 5]
		appliable = [0, 1, 2, 3]
		repeatable = false
		break;
	// Pentaerythritol Tetranitrate
	case 17:
		stats = {display : "Pentaerythritol Tetranitrate", desc : "\"geneva convention? more like geneva. the city. in switzerland.\" \n+|% AOE \n+| pierce \n-|% damage", damage : -0.25, AOE : 0.5, pierceL : 3}
		replace = [50, 3, 25]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// worlds brightest flashlight
	case 18:
		stats = {display : "worlds brightest flashlight", desc : "\"hohoh hoh! i cant wait to give al the little children their presents! whats that bright li-\" \nremoves camo from enemies every 3rd shot \n-|% attack speed", fireSpeed : -0.5, decamo : true}
		replace = [50]
		appliable = array_filter(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)], find_camo_unique)
		repeatable = false
		oneTime = true
		break;
	// hydrogen
	case 19:
		stats = {display : "hydrogen", desc : "\"hydrogen baby vs coughing bomb\" \nApplies burning effect \n-|% attack speed \n -|% AOE", fireSpeed : -0.25, AOE : -0.1, burn : true}
		replace = [25, 10]
		appliable = global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]
		repeatable = false
		oneTime = true
		break;
	// Hey Guys I Think There's a Fly Biting Me
	case 20:
		stats = {display : "Hey Guys I Think There's a Fly Biting Me", desc : "\"oh dont worry i'll get that for you\" \n+|% AOE \n-|% damage", damage : -0.5, AOE : 1}
		replace = [100, 50]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// Whats a Physics?
	case 21:
		stats = {display : "Whats a Physics?", desc : "\"no way guys iots albert einstein! its albert einstein guys!\" \n+| pierce", pierceL : 3}
		replace = [3]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// A Litteraly Mini Nuke
	case 22:
		stats = {display : "A Litteraly Mini Nuke", desc : "\"hey aren't we worried about the fallout? 4?\" \n+|% damage \n+|% AEO \n+|% pierce \n-|% attack speed", damage : 0.5, AOE : 0.5, pierce : 0.5, fireSpeed : -1}
		replace = [50, 50, 50, 100]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// sharp explosions
	case 23:
		stats = {display : "sharp explosions", desc : "\"what do you mean the explosion is sharp, it seems pretty dumb to me!\" \n+|% damage \n-|% pierce", damage : 1.25, pierce : -0.75}
		replace = [125, 75]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// (the) Radiance
	case 24:
		stats = {display : "(the) Radiance", desc : "\"what am i gonna do, fight the sun?\" \nStuns enemies for (damage / enemy hp) * | seconds \n-|% Attack Speed", stun : 2, fireSpeed : -0.25}
		replace = [2, 25]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// DESTROY
	case 25:
		stats = {display : "DESTROY", desc : "\"YOU CAN'T ESCAPE\" \nHit is delayed by | seconds \n+|% Damage \n+|% Attack Speed", fireSpeed : 0.05, damage : 0.25, delay : 30}
		replace = [0.5, 25, 5]
		appliable = [4, 5, 6, 7]
		repeatable = false
		break;
	// bro im lagging i swaer
	case 26:
		stats = {display : "bro im lagging i swaer", desc : "\"my ping is over 9000\" \nAims at where the enemy was instead of where it is \n+|% Attack Speed", fireSpeed : 0.5, lead : false}
		replace = [50]
		appliable = [4, 5]
		appliable = global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]
		repeatable = false
		oneTime = true
		break;
	// Gunner: Soldier
	case 27:
		stats = {display : "Soldier", desc : "Pierce 1 >> 2 \nAttack Speed 21 >> 30 \nDamage 1 >> 3 \nRange 250 >> 350", gunner4 : true}
		tier4 = true
		appliable = [0]
		repeatable = true
		break;
	// Sniper: Assassin
	case 28:
		stats = {display : "Assassin", desc : "Damage 7 >> 14 \nAttack Speed 90 >> 120 \nRange 500 >> 600 \nEach consecutive hit on one enemy makes the sniper do an additional +20% damage up to 400% damage.", sniper4 : true}
		tier4 = true
		appliable = [1]
		repeatable = true
		break;
	// Railgunner: Gauss Machine Gun
	case 29:
		stats = {display : "Gauss Machine Gun", desc : "Damage 75 >> 80 \nAttack Speed 300 >> 600 \nPierce 20 >> 30 \nShoots out a burst of high energy beams for 1 second (10 shots total)", railgunner4 : true}
		tier4 = true
		appliable = [2]
		repeatable = true
		break;
	// Evaporator: Dissapator
	case 30:
		stats = {display : "Dissapator", desc : "Damage 1000 >> 2500 \nRange 400 >> 500 \nPierce 1 >> 50 \nAttack Speed 600 >> 1200 \nCreates an explosion upon impact", evaporator4 : true}
		tier4 = true
		appliable = [3]
		repeatable = true
		break;
	// Boomer: Grenadier
	case 31:
		stats = {display : "Grenadier", desc : "Damage 2 >> 3 \nAttack Speed 60 >> 30 \nRange 200 >> 250 \nAOE 3 >> 9", boomer4 : true}
		tier4 = true
		appliable = [4]
		repeatable = true
		break;
	// Flamer: Pyromaniac
	case 32:
		stats = {display : "Pyromaniac", desc : "Attack Speed 30 >> 12 \nRange 150 >> 250 \nPierce 1 >> 20 \nFire: 10 damage over 3 1/3 seconds >> 30 damage over 5 seconds", flamer4 : true}
		tier4 = true
		appliable = [5]
		repeatable = true
		break;
	// Puncher: Heavyweight
	case 33:
		stats = {display : "Heavyweight", desc : "Damage 5 >> 10 \nAttack Speed 30 >> 21 \nPierce 5 >> 7 \nStuns enemies for (damage / enemy hp) * 6 seconds", puncher4 : true}
		tier4 = true
		appliable = [6]
		repeatable = true
		break;
	// Laser: Tachyon Beam
	case 34:
		stats = {display : "Tachyon Beam", desc : "Damage 3 >> 7 \nPierce 25 >> 100 \nLaser turns into a reactor that damages enemies in a radius", laser4 : true}
		tier4 = true
		appliable = [7]
		repeatable = true
		break;
	// Psychiatrist
	case 42:
		stats = {display : "Psychiatrist", desc : "what are you talking about? girls? united? really? are they? \n+|% effects to towers with Schizophrenia \n Or if moneymaker \n+10% money for each tower with Schizophrenia", psychiatrist : 1}
		replace = [50, 10]
		appliable = [8, 9, 10, 11]
		repeatable = false
		break;
	// eyes on the prize
	case 43:
		stats = {display : "eyes on the prize", desc : "\"dude i gotta invest in girlscoin\" \nevery support tower makes money based on their cost \n-|% nerf to effect", eyesOnThePrize : 1, buff : -0.8}
		replace = [80]
		appliable = [8, 10, 11]
		repeatable = false
		break;
	// pocketer
	case 44:
		stats = {display : "pocketer", desc : "\"poo   fart  keyboard makes me    slam th e  spacebar  t  o       space  it out\" \n+|% more effect \n+|% less range", buff : 0.4, range : -0.5}
		replace = [40, 50]
		appliable = [8, 10, 11]
		repeatable = false
		break;
	// big eyes
	case 45:
		stats = {display : "big eyes", desc : "\"🤓\" \n+|% range \n-|% effect", buff : -0.1, range : 0.5}
		replace = [50, 10]
		appliable = [8, 10, 11]
		repeatable = false
		break;
	// i dont have very many beans so you guys are gonna have to share
	case 46:
		stats = {display : "i dont have very many beans so you guys are gonna have to share", desc : "\"turns your support towers into single mothers\" \n+|% effect \n-|% effect for every tower in range", buff : 0.5, notManyBeans : 1}
		replace = [50, 10]
		appliable = [8, 9, 10, 11]
		repeatable = false
		break;
	// chinese sweatshop conditions
	case 47:
		stats = {display : "chinese sweatshop conditions", desc : "\"when i was in china i had to bike 50 miles to school every day through the acid rain while dodging the tigers - the ferocious jade tigers just to work my 900 hour work day\" \n-|% effect nerf \n+|% more effective per tower in range", buff : -0.8, sweatshop : 1}
		replace = [80, 10]
		appliable = [8, 9, 10, 11]
		repeatable = false
		break;
	// lesbian (PLACEHOLDER)
	case 48:
	// Bind
	case 49:
		stats = {display : "Bind", desc : "bound by silk and song, just like me and your mom \n+|% effect \nit only boosts towers every | rounds (even numbered)", buff : 1.5, bind : 1}
		replace = [150, 4]
		appliable = [8, 9, 10, 11]
		repeatable = false
		break;
	// child support (PLACEHOLDER)
	case 50:
	// addiction (PLACEHOLDER)
	case 51:
	// JOTE
	case 52:
		stats = {display : "JOTE", desc : "Jack of the Everything \n+|% effect power \n+|% attack speed \n+|% damage \n+|% range", buff : 0.1, fireSpeed : 0.1, damage : 0.1, range : 0.1}
		replace = [10, 10, 10, 10]
		appliable = [12, 13, 14]
		repeatable = false
		break;
	// You don't know JACK
	case 53:
		stats = {display : "You don't know JACK", desc : "font reference??!?!?!?? \n-|% effect power \n+|% damage \n+|% attack speed", buff : -0.5, fireSpeed : 0.2, damage : 0.25}
		replace = [50, 25, 20]
		appliable = [12, 13, 14]
		repeatable = false
		break;
	// Teh 11 of Spades
	case 54:
		stats = {display : "Teh 11 of Spades", desc: "or clubs, or hearts, or diamonds \n+|% effect power \n-|% damage \n-|% attack speed", buff : 0.5, fireSpeed : -0.2, damage : -0.25}
		replace = [50, 25, 20]
		appliable = [12, 13, 14]
		repeatable = false
		break;
	// BEEG GUNZ
	case 55:
		stats = {display : "BEEG GUNZ", desc : "\"we have maybe 4 SMGs left, those are the only ones we have because of glitched production.\" \n+|% damage \n+|% AOE \n+| pierce", damage : 0.2, AOE : 0.25, pierceL : 3}
		replace = [20, 25, 3]
		appliable = [12, 13, 14]
		repeatable = false
		break;
	// beer
	case 56:
		stats = {display : "beer", desc : "scottish cyclopse \n+|% effect \nfirerate oscillates between -|% and +|%", buff : 0.5, beer : 1}
		replace = [50, 100, 50]
		appliable = [12, 13, 14]
		repeatable = false
		break;
	// JOAHTE
	case 57:
		stats = {display : "JOAHTE", desc : "Jack of All Horrible Trades Extraordinaire \n-|% effects \n-|% attack rate \n-|% range \n-|% AOE \n-|% pierce \nCan't be sold \n+|% Damage", buff : -0.5, fireSpeed : -0.5, range : -0.5, AOE : -0.5, pierceL : -0.5, damage : 2.5, joathe : 1}
		replace = [50, 50, 50, 50, 50, 250]
		appliable = [12, 13, 14]
		repeatable = false
		break;
}