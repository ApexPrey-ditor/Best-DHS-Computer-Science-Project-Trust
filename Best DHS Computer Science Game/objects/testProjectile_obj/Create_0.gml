image_xscale = 0.05
image_yscale = 0.05
aftereffect = 0

if speed == 0 {
	sprite_index = testPunch_spr
	image_angle = direction
	aftereffect = 6
	image_xscale = 0.1
	image_yscale = 0.05
}
if speed < 0 {
	aftereffect = -speed
	if special != "laser" {
		sprite_index = testLaser_spr
	}
	speed = 0
	image_xscale = 3
	image_angle = direction
}