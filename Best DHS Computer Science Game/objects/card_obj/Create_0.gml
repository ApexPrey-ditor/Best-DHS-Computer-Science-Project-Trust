direction = -90

pickable = false
selecting = false
dissapate = false

effectiveness = [0.5, 1, 2]

repeatable = false
oneTime = false
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
		stats = {display : "Lose Yourself", desc : "\"His palms are palms, palms weak, arms are palms, there’s palms on his palms already, mom’s palms.\" \n+|% Damage\n -|% Fire Rate", damage : 1, fireSpeed : -0.45}
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
		appliable = array_intersection([4, 5, 6, 7], global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)])
		repeatable = false
		break;
}