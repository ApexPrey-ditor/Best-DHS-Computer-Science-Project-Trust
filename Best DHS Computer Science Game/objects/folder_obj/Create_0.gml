direction = -90
image_angle = 180

image_xscale = 24
image_yscale = 24

// alarm storage for pausing and fast forward
alarmList = []

dissapate = false

var cards = []

if global.stage <= 5 {
	cards = [global.towerPool[irandom_range(0, array_length(global.towerPool) - 1)], global.towerPool[irandom_range(0, array_length(global.towerPool) - 1)], global.towerPool[irandom_range(0, array_length(global.towerPool) - 1)]]
	while (cards[1] == cards[0]) {
		cards[1] = global.towerPool[irandom_range(0, array_length(global.towerPool) - 1)]
	}
	while (cards[2] == cards[0] or cards[2] == cards[1]) {
		cards[2] = global.towerPool[irandom_range(0, array_length(global.towerPool) - 1)]
	}
}
else {
	cards = [global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)], global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]]
	while (cards[1] == cards[0]) {
		cards[1] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
	}
	while (cards[2] == cards[0] or cards[2] == cards[1]) {
		cards[2] = global.upgradePool[irandom_range(0, array_length(global.upgradePool) - 1)]	
	}
}

instance_create_layer(x - 512, y - 32, "Selections", card_obj, {image_angle : -120, image_index : cards[0]})
instance_create_layer(x, y, "Selections", card_obj, {image_angle : -190, image_index : cards[1]})
instance_create_layer(x + 512, y + 16, "Selections", card_obj, {image_angle : -210, image_index : cards[2]})