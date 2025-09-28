// initializes values for the new wave
points = ceil(power(1.1, global.wave) + 5 * global.wave + 10)
bias = power(1.075, global.wave) + global.wave - 1
values = [0, 0, 0]
enemies = 0

// spawns enemy based on fast forward
alarm[0] = 60 / global.fastForward