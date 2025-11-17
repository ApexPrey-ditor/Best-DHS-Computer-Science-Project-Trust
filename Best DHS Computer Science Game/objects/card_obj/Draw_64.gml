if (selecting) {
	draw_set_font(archive)
	for (var i = 0; i < sprite_get_number(towerIcons256_spr) - 1; i++) {
		if (i < 12) {
			if (array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
				draw_sprite_ext(towerIcons256_spr, i, room_width / 2 + ((sprite_get_width(towerIcons256_spr) * ((i % 4) - 2)) + (16 * (i % 4)) - 24), room_height / 2 + (272 * (floor(i / 4) - 2)) + 8, 1, 1, 0, c_white, 1)
			}
			else {
				draw_sprite_ext(towerIcons256_spr, i, room_width / 2 + ((sprite_get_width(towerIcons256_spr) * ((i % 4) - 2)) + (16 * (i % 4)) - 24), room_height / 2 + (272 * (floor(i / 4) - 2)) + 8, 1, 1, 0, c_dkgrey, 1)
			}
		}
		else {
			if (array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
				draw_sprite_ext(towerIcons256_spr, i, room_width / 2 - 408 + (i - 12) * 272, room_height / 2 + 280, 1, 1, 0, c_white, 1)
			}
			else {
				draw_sprite_ext(towerIcons256_spr, i, room_width / 2 - 408 + (i - 12) * 336, room_height / 2 + 280, 1, 1, 0, c_dkgrey, 1)
			}
		}
	}
}

reset_draw()