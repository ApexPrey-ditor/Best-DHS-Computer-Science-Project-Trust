// makes the projectile half its actual size
image_xscale = 0.05
image_yscale = 0.05

// sets how many frames it takes for a projectile to disappear
aftereffect = 0

// creates alarm list (store alarm values) and prespeed (stores speed) for pausing
alarmList = []
prespeed = speed

/*
speed == 0 for punch
speed < 0 for laser
speed > 0 for other projectiles
changes size, direction, and other aspects of projectile for the type
*/
if (speed == 0) {
	sprite_index = testPunch_spr
	image_angle = direction
	aftereffect = 6 / global.fastForward
	image_xscale = 0.1
	image_yscale = 0.05
}
else if (speed < 0) {
	aftereffect = -speed  / global.fastForward
	if (special != "laser") {
		sprite_index = testLaser_spr
	}
	speed = 0
	image_xscale = 3
	image_angle = direction
}
else {
	speed *= global.fastForward
}