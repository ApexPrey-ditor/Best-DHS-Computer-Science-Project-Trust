// inverses paused; false = true, true = false
global.paused = not global.paused

if (global.paused) {
	// stores and deactivates alarm of every sprite
	with (all) {
		alarmList = alarm

		for (var i = 0; i < array_length(alarm); i++) {
			alarm[i] = 0	
		}
	}
}
else {
	// resets alarm of every sprite
	with (all) {
		for (var i = 0; i < array_length(alarm); i++) {
			alarm[i] = alarmList[i]	
		}
	}
}