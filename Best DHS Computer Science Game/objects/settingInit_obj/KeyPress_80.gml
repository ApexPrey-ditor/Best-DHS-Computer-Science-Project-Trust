// inverses paused; false = true, true = false

global.paused = not global.paused

if (global.paused) {
	// stores and deactivates alarm of every sprite
	
	with (all) {
		for (var i = 0; i < 12; i++) {
			array_push(settingInit_obj.alarmList, alarm[i])
			alarm[i] = -1
		}
	}
}
else {
	// resets alarm of every sprite
	with (all) {
		for (var i = 0; i < 12; i++) {
			alarm[i] = settingInit_obj.alarmList[i]	
		}
	}
}