if (selecting) {
	if mouse_check_button_pressed(mb_left) {
		for (var i = 0; i < sprite_get_number(towerIcons_spr); i++) {
			if (i < 8) {
				if (point_in_rectangle(mouse_x, mouse_y, 32 + i * 242, 32, 192 + i * 242, 192) and array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
					array_push(global.upgrades[i], stats)
				}
			}
			else {
				if (point_in_rectangle(mouse_x, mouse_y, 32 + (i - 8) * 242, room_height - 192, 192 + (i - 8) * 242, room_height - 32) and array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
					array_push(global.upgrades[i], stats)
				}
			}
		}
	}
}
else if (pickable and not global.upgradeMenu) {
	// scales up if being selected
	if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		image_xscale += (15 - image_xscale) / 7
		image_yscale += (15 - image_xscale) / 7
		
		if mouse_check_button_pressed(mb_left) {
			selecting = true
			global.upgradeMenu = true
		}
	}
	else {
		image_xscale -= (image_xscale - 12) / 7
		image_yscale -= (image_xscale - 12) / 7
	}
}
else {
	// if at desired y position
	if (floor(y) == (room_height + 96) / 2) {
		speed = 0
		pickable = true
	}
	else {
		// eases into position and rotation
		speed = ((room_height + 96) / 2 - y) / 60 - 0.13
		if (floor(image_angle) != 0) {
			image_angle += -image_angle / 60 + 0.05
		}
	}
}