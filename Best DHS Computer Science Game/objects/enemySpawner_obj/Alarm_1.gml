// adds boss to enemy count
enemies += 1

// summons boss based on stage
if (global.stage == 1) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 28})
}
else if (global.stage < 6) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 29})
}
else if (global.stage < 11) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 30})
}
else if (global.stage < 16) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 31})
}
else if (global.stage < 19) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 32})
}
if (global.stage == 19) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 33})
}
if (global.stage == 20) {
	instance_create_layer(0, 0, "Enemies", testEnemy_obj, {type : 34})
}

endWave = true