if (global.skillPoints > 0) {
	switch (image_index) {
		case 0:
			global.skillPoints--
			global.skillTreeModifiers[0] = 1.025
			image_index = 11
			break;
		case 1:
			global.skillPoints--
			global.skillTreeModifiers[1] = 1.025
			image_index = 11
			break;
		case 2:
			global.skillPoints--
			global.skillTreeModifiers[2] = 1.025
			image_index = 11
			break;
		case 3:
			global.skillPoints--
			global.skillTreeModifiers[3] = 1.05
			image_index = 11
			break;
		case 4:
			global.skillPoints--
			global.skillTreeModifiers[4] = 50
			image_index = 11
			break;
		case 5:
			global.skillPoints--
			global.skillTreeModifiers[5] = 1.015
			image_index = 11
			break;
		case 6:
			global.skillPoints--
			global.skillTreeModifiers[6] = 1.025
			image_index = 11
			break;
		case 7:
			global.skillPoints--
			global.skillTreeModifiers[7] = 1.025
			image_index = 11
			break;
		case 8:
			global.skillPoints--
			global.skillTreeModifiers[8] = 5
			image_index = 11
			break;
		case 9:
			global.skillPoints--
			global.skillTreeModifiers[9] = 1
			image_index = 11
			break;
		case 10:
			global.skillPoints--
			global.skillTreeModifiers[10] = 5
			image_index = 11
			break;
	}
}