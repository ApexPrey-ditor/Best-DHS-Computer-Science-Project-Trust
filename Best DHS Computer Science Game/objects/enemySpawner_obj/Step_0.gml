if (global.waveTransition) {
	global.wave += 1
	global.waveTransition = 0
	event_user(0)
}
if (endWave and enemies == 0) {
	global.money += 50 + global.wave * 50
	
	endWave = false
}