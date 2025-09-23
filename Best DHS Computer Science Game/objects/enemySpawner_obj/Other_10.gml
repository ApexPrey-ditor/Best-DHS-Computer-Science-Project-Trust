points = ceil(power(1.1, global.wave) + 5 * global.wave + 10)
bias = power(1.075, global.wave) + global.wave - 1
values = [0, 0, 0]
enemies = 0

if global.wave > 1 {
	global.money += 50 + global.wave * 50
}

alarm[0] = 60