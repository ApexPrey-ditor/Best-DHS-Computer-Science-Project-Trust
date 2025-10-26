// randomizes the seed
randomize()

// make particle system
main_ps = part_system_create()

//Set up for Flamethrower
flameType = part_type_create()

part_type_shape(flameType, pt_shape_flare)
part_type_scale(flameType, 1, 1)
part_type_size(flameType, 1, 1, -0.003, 0)


part_type_speed(flameType, 5, 6, -0.07, 0.5)
part_type_gravity(flameType, 0, 0)
part_type_direction(flameType, 75, 105, 0, 0.5)
part_type_orientation(flameType, 0, 0, 0, 0, false)

part_type_life(flameType, 80, 80)

part_type_color3(flameType, make_color_rgb(255, 67, 0), make_color_rgb(255, 238, 96), make_color_rgb(255, 255, 255))
part_type_blend(flameType, true)
part_type_alpha1(flameType, 1)

// initializes global variables
global.health = 100
global.wave = 0
global.money = 30000
// for when starting a new wave
global.waveTransition = 0
// for when selecting a tower
global.upgradeMenu = false
global.fastForward = 1
global.paused = false
// if placing tower
placing = false

// stores alarms
alarmList = []

// page of tower UI and cost of towers
page = 0
costs = [150, 275, 1000, 3750, 200, 550, 1000, 5000, 850, 700, 3500, 4000, 0, 0, 3500, 0]

// fullscreens
window_set_fullscreen(true)