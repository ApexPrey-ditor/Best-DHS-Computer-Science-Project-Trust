// find object with enemy tag furthest along the path
target = collision_circle(x, y, range, tag_get_asset_ids("Enemy", asset_object), false, true)

if instance_exists(target) and not firing {
	// calculate where the enemy will be along the path
	var leadPosition = target.path_position + ((point_distance(x, y, target.x, target.y) / projSpeed) * target.pathSpeed / path_get_length(target.path_index))
	// creates a projectile with the tower stats, then waits fireSpeed until it can shoot again
	instance_create_layer(x, y, "Projectiles", testProjectile_obj, {damage : damage,
																	speed : projSpeed,
																	direction : point_direction(x, y, path_get_x(target.path_index, leadPosition), path_get_y(target.path_index, leadPosition))})
	firing = true
	alarm[0] = fireSpeed
}