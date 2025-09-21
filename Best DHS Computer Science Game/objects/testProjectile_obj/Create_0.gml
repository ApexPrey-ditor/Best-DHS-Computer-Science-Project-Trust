image_xscale = 0.05
image_yscale = 0.05
aftereffect = 0

if speed < 0 {
	aftereffect = -speed
	sprite_index = testLaser_spr
	speed = 0
	image_xscale = 3
	image_angle = direction
}