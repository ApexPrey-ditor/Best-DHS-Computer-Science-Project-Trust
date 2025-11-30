// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_type_damage(target, detections, damage) {
	multiplier = 1
	
	if (target.class[1] == true and detections[1] == false) {
		multiplier = 0
	}
	if (target.class[2] == true) {
		if (detections[0] == true or detections[1] == true) {
			multiplier = 0.5
		}
		if (detections[0] == true and detections[1] == true) {
			multiplier = 0.75
		}
		if (detections[2] == true) {
			multiplier = 1
		}
	}
	
	return (damage * multiplier * target.weakness) / target.damageResist
}