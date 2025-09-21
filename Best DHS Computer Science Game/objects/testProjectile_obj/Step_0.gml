// checks if touching enemy
var enemy = instance_place(x, y, tag_get_asset_ids("Enemy", asset_object))

if instance_exists(enemy) {
	// if so decrease enemy hp and delete projectile
	enemy.hp -= damage
	if (enemy.hp <= 0) {
		instance_destroy(enemy)
	}
	instance_destroy()
}