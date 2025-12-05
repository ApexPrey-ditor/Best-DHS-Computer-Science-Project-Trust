if (global.waveTransition) {
	// sets up new wave
	global.waveTransition = false
	event_user(0)
}
if (endWave and enemies == 0) {
	if (global.wave == global.stage * 2) {
		audio_group_set_gain(MusicBosses, 0, 500)
		audio_group_set_gain(Music, 0, 500)
		audio_group_set_gain(MusicCalm, 0, 500)
	}
	else {
		audio_group_set_gain(Music, 0, 500)
		audio_group_set_gain(MusicCalm, 1, 500)
	}
	
	// at the end of wave give money
	global.money += ceil(50 + global.wave * 50) * global.modEffects[6]
	global.wave += 1
	
	endWave = false
	waveCash = true
	alarm[3] = 1
}