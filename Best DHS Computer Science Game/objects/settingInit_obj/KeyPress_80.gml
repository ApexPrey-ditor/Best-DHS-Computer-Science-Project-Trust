// inverses paused; false = true, true = false

global.paused = not global.paused

if (global.paused) {
	// stores and deactivates alarm of every sprite
	
	with (all) {
		if (object_index == tower_obj or object_index == enemy_obj) {
			pausedAnimSpeed = image_speed
			image_speed = 0
		}
		for (var i = 0; i < 12; i++) {
			array_push(alarmList, alarm[i])
			alarm[i] = -1
		}
	}
}
else {
	// resets alarm of every sprite
	with (all) {
		if (object_index == tower_obj or object_index == enemy_obj) {
			image_speed = pausedAnimSpeed
		}
		for (var i = 0; i < 12; i++) {
			alarm[i] = alarmList[i]	
		}
		
		alarmList = []
	}
}