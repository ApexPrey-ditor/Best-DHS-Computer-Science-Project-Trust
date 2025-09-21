// temporary place to initialize health
global.health = 100

// makes an enemy every 2 seconds

instance_create_layer(0, 0, "Enemies", testEnemy_obj)

alarm[0] = 120