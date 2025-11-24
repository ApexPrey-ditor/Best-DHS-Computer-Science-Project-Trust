if (global.waveTransition) {
	// sets up new wave
	global.waveTransition = 0
	event_user(0)
}
if (endWave and enemies == 0) {
	// at the end of wave give money
	global.money += ceil(50 + global.wave * 50) * global.modEffects[6]
	global.wave += 1
	
	endWave = false
}