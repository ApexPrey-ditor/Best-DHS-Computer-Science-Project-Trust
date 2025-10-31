// adds boss to enemy count
enemies += 1

// summons boss based on stage
switch (global.stage) {
	case 1:
		currentBoss = 28
		break;
	case 2:
		currentBoss = 29
		break;
	case 6:
		currentBoss = 30
		break;
	case 11:
		currentBoss = 31
		break;
	case 16:
		currentBoss = 32
		break;
	case 19:
		currentBoss = 33
		break;
	case 20:
		currentBoss = 34;
		break;
}
instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : currentBoss})
endWave = true