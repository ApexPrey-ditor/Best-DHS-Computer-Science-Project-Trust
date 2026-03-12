if (!global.paused) {
	switch (image_index) {
		case 0:
			audio_stop_all()
			room_goto(radarRoom)
			break;
		case 1:
			game_end()
			break;
		case 2:
			layer_set_visible("SkillTree", true)
			global.paused = true
			pauseMenu_obj.goUp = false
			break;
		case 3:
			global.paused = true
			pauseMenu_obj.goUp = true
			pauseMenu_obj.sprite_index = logbook_spr
			pauseMenu_obj.image_index = 0
			break;
	}
}
else {
	if (image_index == 2) {
		layer_set_visible("SkillTree", false)
		global.paused = false
		pauseMenu_obj.goUp = false
	}
}