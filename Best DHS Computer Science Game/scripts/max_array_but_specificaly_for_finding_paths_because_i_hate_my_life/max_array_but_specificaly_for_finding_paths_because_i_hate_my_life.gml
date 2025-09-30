// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function max_array_but_specificaly_for_finding_paths_because_i_hate_my_life(array) {
	highscore = -infinity
	position = 0
	
	for (var i = 0; i < ds_list_size(array); i++) {
		if ds_list_find_value(array, i).path_position > highscore {
			highscore = ds_list_find_value(array, i).path_position
			position = i
		}
	}
	
	return position
}