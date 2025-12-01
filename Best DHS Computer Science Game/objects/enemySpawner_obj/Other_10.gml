// initializes values for the new wave
points = ceil((power(1.1935, global.wave) + 5 * global.wave + 10) * global.modEffects[9])
bias = power(1.07, global.wave) + 0.5 * global.wave - 0.5
values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
enemies = 0

enemyNum = 0

spawning = true

// spawns enemy
alarm[0] = 1