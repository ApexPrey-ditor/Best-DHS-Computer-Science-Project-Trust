// makes the projectile tenth its actual size
image_xscale = 0.5
image_yscale = 0.5

// offsets direction based on spread
direction += random_range(-spread, spread)

// creates alarm list (store alarm values) and prespeed (stores speed) for pausing
alarmList = []
prespeed = speed

// for pierce not multihitting
hit = []

if (tier4) {
	sprite_index = grenade_spr
	image_angle = direction
}
// sets sprite to flame if flamethrower
if (special == "flame") {
	sprite_index = fire_spr
	image_angle = direction
	image_xscale = 0.5 + sqrt(aoe - 1)
	image_yscale = 0.5 + sqrt(aoe - 1)
}
// sets sprite to soundwave if rapper
if (special == "rapper") {
	sprite_index = soundwave_spr
	image_angle = direction
	
	image_xscale = 0.1
	image_yscale = 0.1
}
if (special == "debt collector") {
	sprite_index = pellet_spr
}
if (type == 1) {
	image_alpha = 0
	sprite_index = bomb_spr
	alarm[0] = ceil((lifetime + effect[0]) / global.fastForward)
	alarm[1] = ceil(effect[0] / global.fastForward)
}
else {
	alarm[0] = ceil(lifetime / global.fastForward)
}