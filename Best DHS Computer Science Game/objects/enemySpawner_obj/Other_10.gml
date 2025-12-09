// initializes values for the new wave
points = ceil((power(1.1935, global.wave) + 5 * global.wave + 10) * global.modEffects[9])
bias = power(1.07, global.wave) + 0.5 * global.wave - 0.5
values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
enemies = 0

enemyNum = 0

spawning = true

if (global.wave == global.stage * 2) {
	if (global.stage == 1) {
		audio_play_sound(finalFraud, 1, true)
	}
	else if (global.stage < 6) {
		audio_play_sound(msNegativity, 1, true)
	}
	else if (global.stage < 11) {
		audio_play_sound(aBriefLessonInFineArts, 1, true)
	}
	else if (global.stage < 16) {
		audio_play_sound(tungsten, 1, true)
	}
	else if (global.stage < 19) {
		audio_play_sound(menace, 1, true)
	}
	if (global.stage == 19) {
		audio_play_sound(menace, 1, true)
	}
	if (global.stage == 20) {
		audio_play_sound(EVILBreakcore, 1, true)
	}
}

// spawns enemy
alarm[0] = 1