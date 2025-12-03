dissapate = false

// alarm storage for pausing and fast forward
alarmList = []

image_index = global.modifierPool[irandom_range(0, array_length(global.modifierPool) - 1)]

if (image_index == 18) {
	deathIndex = -1
	for (var i = array_length(global.modifiers) - 1; i >= 0; i--) {
		if (array_contains(global.modifierPool, global.modifiers[i]) and global.modifiers[i] != 18) {
			deathIndex = global.modifiers[i]
			break;
		}
	}
	
	if (deathIndex == -1) {
		while (image_index == 18) {
			image_index = global.modifierPool[irandom_range(0, array_length(global.modifierPool) - 1)]
		}
	}
}

function apply_effects(index, multi) {
	switch (index) {
		case 0:
			// Time waster
			global.modEffects[0] = global.modEffects[0] * 2 * multi
			global.modEffects[1] = global.modEffects[1] * 2 * multi
			global.modEffects[2] = global.modEffects[2] * 2 * multi
			break;
		case 1:
			// Chonker
			global.modEffects[3] += 0.2 * multi
			break;
		case 2:
			// Wheel
			global.modEffects[4] += 0.2 * multi
			break;
		case 3:
			// We are running out of money to buy you all beans
			global.modEffects[5] -= 30 * multi
			break;
		case 4:
			// Scammed
			global.modEffects[6] -= 0.1 * multi
			break;
		case 5:
			// Legal Issues
			global.modEffects[7] -= 0.1 * multi
			break;
		case 6:
			// No House Insurance
			global.modEffects[8] -= 9.9 * multi
			break;
		case 7:
			// ultrascitzo
			global.scitzo = true
			array_delete(global.modifierPool, array_get_index(global.modifierPool, image_index), 1)
			break;
		case 8:
			// Bruh you slow af
			global.towerStats[1] = global.towerStats[1] / (1.2 * multi)
			break;
		case 9:
			// Bruh you weak af
			global.towerStats[0] = global.towerStats[0] / (1.2 * multi)
			break;
		case 10:
			// They messed up my prescription
			global.towerStats[2] = global.towerStats[2] / (1.2 * multi)
			break;
		case 11:
			// Negative Reinforcement
			global.towerStats[3] = global.towerStats[2] / (1.5 * multi)
			break;
		case 12:
			// You play well but can you tango with 2?
			global.modEffects[9] += 0.2 * multi
			break;
		case 13:
			// Big and Burly
			global.modEffects[10] += 0.15 * multi
			break;
		case 14:
			// Inflation
			global.modEffects[11] += 0.1 * multi
			break;
		case 15:
			// Awful Game Design
			global.modEffects[12] -= 0.25 * multi
			if (global.modEffects[12] <= 0) {
				array_delete(global.modifierPool, array_get_index(global.modifierPool, image_index), 1)
			}
			break;
		case 16:
			// The Moon
			global.permClass[0] = true
			array_delete(global.modifierPool, array_get_index(global.modifierPool, image_index), 1)
			break;
		case 17:
			// The Sun
			global.permClass[1] = true
			array_delete(global.modifierPool, array_get_index(global.modifierPool, image_index), 1)
			break;
		case 18:
			// Death
			apply_effects(deathIndex, global.modEffects[14])
			apply_effects(deathIndex, global.modEffects[14])
			break;
		case 19:
			// The Fool
			global.fool = true
			array_delete(global.modifierPool, array_get_index(global.modifierPool, image_index), 1)
			break;
		case 20:
			// The Magician
			global.modEffects[13] += 0.25 * multi
			break;
		case 21:
			// The High Priestess
			global.modEffects[14] += 0.15
			break;
		case 22:
			// The Empress
			global.modEffects[15] += 2 * multi
			break;
		case 23:
			// Temperance
			if (global.modEffects[16] == infinity) {
				global.modEffects[16] = 40 / multi
			}
			else {
				global.modEffects[16] -= 5 * multi
			}
			break;
		case 24:
			// The Fortune Teller
			var tarrowPool = array_intersection(global.modifierPool, [16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29])
			apply_effects(tarrowPool[irandom_range(0, array_length(tarrowPool) - 1)], global.modEffects[14])
			break;
		case 25:
			// The Wheel of Fortune
			randomV = irandom_range(1, 10)
			
			if (randomV > 5) {
				global.modEffects[4] -= 0.1 * multi
			}
			else if (randomV > 1) {
				global.modEffects[4] += 0.25 * multi
			}
			else {
				global.modEffects[4] += 1 * multi
			}
			break;
		case 26:
			// Judgement
			global.modEffects[17] += 0.25 * multi
			global.modEffects[18] += 0.25 * multi
			break;
		case 27:
			// The Strength
			global.modEffects[19] += 0.2 * multi
			break;
		case 28:
			// The World
			global.modEffects[20] += 1 * multi
			break;
		case 29:
			// The Tower
			global.modEffects[21] += 0.35 * multi
			break;
	}
}