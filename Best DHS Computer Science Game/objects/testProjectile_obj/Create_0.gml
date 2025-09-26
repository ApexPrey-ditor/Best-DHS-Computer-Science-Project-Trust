image_xscale = 0.05
image_yscale = 0.05
aftereffect = 0

if speed == 0 {
	sprite_index = testPunch_spr
	image_angle = direction
	aftereffect = 6 / global.fastForward
	image_xscale = 0.1
	image_yscale = 0.05
}
else if (speed < 0) {
	aftereffect = -speed  / global.fastForward
	if special != "laser" {
		sprite_index = testLaser_spr
	}
	speed = 0
	image_xscale = 3
	image_angle = direction
}
else {
	speed *= global.fastForward
}