// find object with enemy tag furthest along the path
target = collision_circle(x, y, range, tag_get_asset_ids("Enemy", asset_object), false, true)

if instance_exists(target) and not firing {
	// creates a projectile with the tower stats, then waits fireSpeed until it can shoot again
	instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																	speed : projSpeed,
																	direction : point_direction(x, y, target.x, target.y)})
	firing = true
	alarm[0] = fireSpeed
}