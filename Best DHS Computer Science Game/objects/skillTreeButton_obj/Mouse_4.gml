if (global.skillPoints > global.skillTreeLevels[image_index] and image_index < 11 and layer_get_visible("SkillTree")) {
	global.skillPoints -= global.skillTreeLevels[image_index] + 1
	global.skillTreeLevels[image_index] += 1
	
	switch (image_index) {
		case 0:
			// Weak Points
			global.skillTreeModifiers.damage += 0.025
			break;
		case 1:
			// Training
			global.skillTreeModifiers.fireRate += 0.025
			break;
		case 2:
			// Prescriptions
			global.skillTreeModifiers.range += 0.025
			break;
		case 3:
			// Morale
			global.skillTreeModifiers.effectStength += 0.05
			break;
		case 4:
			// Funding
			global.skillTreeModifiers.startingCash += 50
			break;
		case 5:
			// Thievery
			global.skillTreeModifiers.cashFromEnemies += 0.015
			break;
		case 6:
			// Development
			global.skillTreeModifiers.cashFromWaves += 0.025
			break;
		case 7:
			// Efficient Retreat
			global.skillTreeModifiers.cashFromSelling += 0.025
			break;
		case 8:
			// Infrastructure
			global.skillTreeModifiers.maxHealth += 5
			break;
		case 9:
			// Rebuilding
			global.skillTreeModifiers.healthRegen += 1
			break;
		case 10:
			// Home Front
			global.skillTreeModifier.overheal += 5
			break;
	}
}