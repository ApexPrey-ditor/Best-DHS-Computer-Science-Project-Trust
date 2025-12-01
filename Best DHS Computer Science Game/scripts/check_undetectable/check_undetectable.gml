// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_undetectable(enemy, detections) {
	// removes all the enemies that are ghost dead, or cant be detected
	if (enemy.deactivated) or
		(enemy.class[0] == true and detections[0] == false) or
		(enemy.class[2] == true and not array_contains(detections, true)) {
		return false
	}
	else {
		return true
	}
}