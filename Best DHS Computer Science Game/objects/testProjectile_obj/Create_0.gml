// makes the projectile half its actual size
image_xscale = 0.05
image_yscale = 0.05

// offsets direction based on spread
direction += random_range(-spread, spread)

// sets how many frames it takes for a projectile to disappear
aftereffect = 0

// creates alarm list (store alarm values) and prespeed (stores speed) for pausing
alarmList = []
prespeed = speed

alarm[0] = ceil(lifetime / global.fastForward)

/*
type = 0 for projectiles
type = 2 for laser
type = 3 for punch
changes size, direction, and other aspects of projectile for the type
*/

switch (type) {
	case 0:
		speed *= global.fastForward
		break;
	case 1:
		aftereffect = speed / global.fastForward
		if (special != "laser") {
			sprite_index = testLaser_spr
		}
		speed = 0
		image_xscale = 3
		image_angle = direction
		break;
	case 2:
		sprite_index = testPunch_spr
		image_angle = direction
		aftereffect = 6 / global.fastForward
		image_xscale = 0.1
		image_yscale = 0.05
		break;
}

// sets sprite to flame if flamethrower
if special == "flame" {
	sprite_index = fire_spr
	image_xscale = 1
	image_yscale = 1
}

