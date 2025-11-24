// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function remove_undetectable(enemies, detections) {
	// removes all the enemies that are ghost dead, or cant be detected
	for (var i = 0; i < ds_list_size(enemies); i++) {
		if ((ds_list_find_value(enemies, i).deactivated) or
			(ds_list_find_value(enemies, i).class[0] == true and detections[0] == false) or
			(ds_list_find_value(enemies, i).class[2] == true and not array_contains(detections, true))) {
			ds_list_delete(enemies, i)
			i--
		}
	}
	
	return enemies
}