// initializes global variables
global.health = global.modEffects[8]
global.first = true
global.wave = floor(global.stage / 2) + 1
// for testing final wave of each stage:
//global.wave = floor(global.stage) * 2
global.money = global.modEffects[5]
//global.money = 3000000000000000000000
for (var i = 0; i < global.wave; i++) {
	global.money += 50 + i * 50
}
// for when starting a new wave
global.waveTransition = 0
// for when selecting a tower
global.upgradeMenu = false
global.addictionBuyable = false

selection = 0

if (room != radarRoom) {
	audio_stop_all()
	
	audio_play_sound(songs[mapId], 1, true)
	audio_play_sound(songsCalm[mapId], 1, true)
	
	audio_group_set_gain(Music, 0)
	audio_group_set_gain(MusicCalm, 1)
}

if (irandom_range(0, 1) == 0) {
	//nextBlip = [irandom_range(0, 22) * 2, 496, 0]
	nextBlip = [irandom_range(0, 22) * 2, 2, 0]
	prevBlip = [nextBlip[0] + 180, 0, 0]
}
else {
	//nextBlip = [irandom_range(158, 178) * 2, 496, 0]
	nextBlip = [irandom_range(158, 178) * 2, 2, 0]
	prevBlip = [nextBlip[0] - 180, 0, 0]
}