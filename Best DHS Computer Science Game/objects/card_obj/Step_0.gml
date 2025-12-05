if (not global.paused) {
	if (dissapate) {
		x -= (x + 384) / 20 + 0.1
		image_xscale -= (image_xscale - 1) / 7
		image_yscale -= (image_xscale - 1) / 7
	
		image_angle += (x + 384) / 128
	
		if (floor(x) == -384) {
			instance_destroy()
		}
	}
	else if (selecting) {
		if mouse_check_button_pressed(mb_left) {
			if (point_in_rectangle(mouse_x, mouse_y, 16, 16, 152, 48)) {
				selecting = false
				global.upgradeMenu = false
			}
			else {
				for (var i = 0; i < sprite_get_number(towerIcons256_spr) - 1; i++) {
					if (i < 12) {
						if (point_in_rectangle(mouse_x, mouse_y, room_width / 2 + ((sprite_get_width(towerIcons256_spr) * ((i % 4) - 2)) + (16 * (i % 4)) - 24), room_height / 2 + (272 * (floor(i / 4) - 2)) + 8, room_width / 2 + ((sprite_get_width(towerIcons256_spr) * ((i % 4) - 2)) + (16 * (i % 4)) - 24) + 256, room_height / 2 + (272 * (floor(i / 4) - 2)) + 264) and array_contains(appliable, i) and array_contains(global.availableTowers, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
							var newDesc = stats.desc
							for (var w = 0; w < array_length(replace); w++) {
								newDesc = string_replace(newDesc, "|", string(replace[w] * effectiveness[array_length(global.upgrades[i])]))
							}
							if (array_length(global.upgrades[i]) == 2) {
								if (i % 4 < 2) {
									repeat (2000) {
										array_push(global.upgradePool, 27 + i)
									}
								}
								else {
									repeat (1000) {
										array_push(global.upgradePool, 27 + i)
									}
								}
						
								var del = true
								for (var z = 0; z < array_length(appliable); z++) {
									if (array_length(global.upgrades[appliable[z]]) < 3) {
										del = false
									}
								}
								if (del) {
									while (array_contains(global.upgradePool, image_index)) {
										array_delete(global.upgradePool, array_get_index(global.upgradePool, image_index), 1)
									}
								}
							}
							if (oneTime) {
								array_delete(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)], array_get_index(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)], i), 1)
								if (array_length(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]) == 0) {
									while (array_contains(global.upgradePool, image_index)) {
										array_delete(global.upgradePool, array_get_index(global.upgradePool, image_index), 1)
									}
								}
							}
							if (tier4) {
								while (array_contains(global.upgradePool, image_index)) {
									array_delete(global.upgradePool, array_get_index(global.upgradePool, image_index), 1)
								}
							}
					
							stats.desc = newDesc
							array_push(global.upgrades[i], stats)
							selecting = false
							global.upgradeMenu = false
							
							if (global.upgradeAmount <= 0) {
								with (card_obj) {
									dissapate = true
									instance_create_layer(x, y, "Selections", modifierCard_obj)
								}
							}
							else {
								global.upgradeAmount -= 1
								
								cardSelection = [global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]]
								while (cardSelection[1] == cardSelection[0]) {
									cardSelection[1] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
								}
								while (cardSelection[2] == cardSelection[0] or cardSelection[2] == cardSelection[1]) {
									cardSelection[2] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
								}
				
								with (card_obj) {
									dissapate = true
									instance_create_layer(x, y, "Selections", card_obj, {image_index : other.cardSelection[0]})
									array_delete(other.cardSelection, 0, 1)
								}
							}
						}
					}
					else {
						if (point_in_rectangle(mouse_x, mouse_y, room_width / 2 - 408 + (i - 12) * 272, room_height / 2 + 280, room_width / 2 - 408 + (i - 12) * 272 + 256, room_height / 2 + 280 + 256) and array_contains(appliable, i) and (array_length(global.upgrades[i]) < 3 or repeatable)) {
							var newDesc = stats.desc
							for (var w = 0; w < array_length(replace); w++) {
								newDesc = string_replace(newDesc, "|", string(replace[w] * effectiveness[array_length(global.upgrades[i])]))
							}
							if (array_length(global.upgrades[i]) == 2) {
								if (i % 4 == 0) {
									repeat (2000) {
										array_push(global.upgradePool, 27 + i)
									}
								}
								else {
									repeat (1000) {
										array_push(global.upgradePool, 27 + i)
									}
								}
							}
							if (oneTime) {
								array_delete(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)], array_get_index(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)], i), 1)
								if (array_length(global.oneTimesValues[array_get_index(global.oneTimesKey, image_index)]) == 0) {
									while (array_contains(global.upgradePool, image_index)) {
										array_delete(global.upgradePool, array_get_index(global.upgradePool, image_index), 1)
									}
								}
							}
							if (tier4) {
								while (array_contains(global.upgradePool, image_index)) {
									array_delete(global.upgradePool, array_get_index(global.upgradePool, image_index), 1)
								}
							}
					
							stats.desc = newDesc
							array_push(global.upgrades[i], stats)
							selecting = false
							global.upgradeMenu = false
					
							if (global.upgradeAmount <= 0) {
								with (card_obj) {
									dissapate = true
									instance_create_layer(x, y, "Selections", modifierCard_obj)
								}
							}
							else {
								global.upgradeAmount -= 1
								
								cardSelection = [global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]]
								while (cardSelection[1] == cardSelection[0]) {
									cardSelection[1] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
								}
								while (cardSelection[2] == cardSelection[0] or cardSelection[2] == cardSelection[1]) {
									cardSelection[2] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
								}
				
								with (card_obj) {
									dissapate = true
									instance_create_layer(x, y, "Selections", card_obj, {image_index : other.cardSelection[0]})
									array_delete(other.cardSelection, 0, 1)
								}
							}
						}
					}
				}
			}
		}
	}
	else if (pickable and not global.upgradeMenu) {
		// scales up if being selected
		if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
			image_xscale += (1.25 - image_xscale) / 7
			image_yscale += (1.25 - image_xscale) / 7
		
			if mouse_check_button_pressed(mb_left) {
				if (towerCard) {
					show_debug_message(global.availableTowers)
					array_push(global.availableTowers, stats)
					show_debug_message(global.availableTowers)
					array_delete(global.towerPool, array_get_index(global.towerPool, image_index), 1)
				
					cardSelection = [global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]]
					while (cardSelection[1] == cardSelection[0]) {
						cardSelection[1] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
					}
					while (cardSelection[2] == cardSelection[0] or cardSelection[2] == cardSelection[1]) {
						cardSelection[2] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
					}
				
					with (card_obj) {
						dissapate = true
						instance_create_layer(x, y, "Selections", card_obj, {image_index : other.cardSelection[0]})
						array_delete(other.cardSelection, 0, 1)
					}
				}
				else {
					selecting = true
					global.upgradeMenu = true
				}
			}
		}
		else {
			image_xscale -= (image_xscale - 1) / 7
			image_yscale -= (image_xscale - 1) / 7
		}
	}
	else {
		// if at desired y position
		if (floor(y) == (room_height + 96) / 2) {
			pickable = true
		}
		else {
			// eases into position and rotation
			y += ((room_height + 96) / 2 - y) / 60 - 0.13
			if (floor(image_angle) != 0) {
				image_angle += -image_angle / 60 + 0.05
			}
		}
	}
}