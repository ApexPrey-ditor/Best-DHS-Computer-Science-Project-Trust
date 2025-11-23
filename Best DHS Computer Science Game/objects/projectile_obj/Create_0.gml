// makes the projectile half its actual size
image_xscale = 0.05
image_yscale = 0.05

// offsets direction based on spread
direction += random_range(-spread, spread)

// creates alarm list (store alarm values) and prespeed (stores speed) for pausing
alarmList = []
prespeed = speed

// for pierce not multihitting
hit = []

// sets sprite to flame if flamethrower
if special == "flame" {
	sprite_index = fire_spr
	image_xscale = aoe
	image_yscale = aoe
}
if (type == 1) {
	image_alpha = 0
	alarm[0] = ceil((lifetime + effect[0]) / global.fastForward)
	alarm[1] = effect[0]
}
else {
	alarm[0] = ceil(lifetime / global.fastForward)
}