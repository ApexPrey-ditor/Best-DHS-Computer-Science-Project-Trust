if (dissapate) {
	y -= (y + 384) / 20 + 0.1
	image_xscale -= (image_xscale - 1) / 7
	image_yscale -= (image_xscale - 1) / 7
	
	image_angle += (y + 384) / 128
	
	if (floor(y) == -384) {
		instance_destroy()
	}
}
else {
	// scales up if being selected
	if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		image_xscale += (1.25 - image_xscale) / 7
		image_yscale += (1.25 - image_xscale) / 7
		
		if mouse_check_button_pressed(mb_left) {
			array_push(global.modifiers, image_index)
			apply_effects(image_index, global.modEffects[14])
			
			with (modifierCard_obj) {
				dissapate = true
			}
			with (folder) {
				dissapate = true
			}
			with (settingInit_obj) {
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
				
				selection = 2
			}
		}
	}
	else {
		image_xscale -= (image_xscale - 1) / 7
		image_yscale -= (image_xscale - 1) / 7
	}
}