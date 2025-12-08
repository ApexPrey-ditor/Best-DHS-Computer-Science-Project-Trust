switch (image_index) {
	case 0:
	audio_stop_all()
		room_goto(radarRoom)
		break;
	case 1:
		game_end()
		break;
}