global.paused = not global.paused

if global.paused {
	with all {
		alarmList = alarm

		for (var i = 0; i < array_length(alarm); i++) {
			alarm[i] = 0	
		}
	}
}
else {
	with all {
		for (var i = 0; i < array_length(alarm); i++) {
			alarm[i] = alarmList[i]	
		}
	}
}