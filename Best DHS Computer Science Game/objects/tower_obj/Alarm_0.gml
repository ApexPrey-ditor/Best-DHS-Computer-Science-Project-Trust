// enables firing
firing = false
if (not (towerType == 2 and tier4 and doubleShot > 0)) {
	sprite_index = asset_get_index("tower" + string(towerType) + "_spr")
	image_speed = 1
}
// for hacker
follows = []