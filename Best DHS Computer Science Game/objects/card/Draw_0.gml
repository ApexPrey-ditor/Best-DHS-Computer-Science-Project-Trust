draw_self()

if (selecting) {
	draw_set_font(archive)
	for (var i = 0; i < sprite_get_number(towerIcons_spr); i++) {
		if (i < 8) {
			if (array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
				draw_sprite_ext(towerIcons_spr, i, 32 + i * 242, 32, 0.2, 0.2, 0, c_white, 1)
			}
			else {
				draw_sprite_ext(towerIcons_spr, i, 32 + i * 242, 32, 0.2, 0.2, 0, c_grey, 1)
			}
			for (var w = 0; w < array_length(global.upgrades[i]); w++) {
				draw_text(32 + i * 242, 200 + w * 30, global.upgrades[i][w].display)
			}
		}
		else {
			if (array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
				draw_sprite_ext(towerIcons_spr, i, 32 + (i - 8) * 242, room_height - 192, 0.2, 0.2, 0, c_white, 1)
			}
			else {
				draw_sprite_ext(towerIcons_spr, i, 32 + (i - 8) * 242, room_height - 192, 0.2, 0.2, 0, c_grey, 1)
			}
			for (var w = array_length(global.upgrades[i]) - 1; w >= 0; w--) {
				draw_text(32 + (i - 8) * 242, room_height - 200 - (array_length(global.upgrades[i]) - w) * 30, global.upgrades[i][w].display)
			}
		}
	}
}

reset_draw()