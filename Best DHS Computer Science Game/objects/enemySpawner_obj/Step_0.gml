if (global.waveTransition) {
	// Increases wave by 1 and sets up new wave
	global.wave += 1
	global.waveTransition = 0
	event_user(0)
}
if (endWave and enemies == 0) {
	// at the end of wave give money
	global.money += 50 + global.wave * 50
	
	endWave = false
}