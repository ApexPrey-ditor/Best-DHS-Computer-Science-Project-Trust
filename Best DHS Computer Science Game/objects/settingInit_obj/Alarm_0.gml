with (tower_obj) {
	buffs = [1, 1, 1, false, 1, 1, 0, 1, 1, false, 1, 0, 1, 0, 0, 0]
	image_blend = c_white
	if (towerType == 11) {
		if (array_length(buffing) > 0) {
			var towers = ds_list_create()
			collision_circle_list(x, y, range * buffs[2] * buffs[12] * multis[2], tag_get_asset_ids("Tower", asset_object), false, true, towers, false)
			buffing[0].buffs[4] = (effect[0] - (ds_list_size(towers) * (effect[0] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[0] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
			buffing[0].buffs[15] = (childSupport - (ds_list_size(towers) * (childSupport / 10) * notManyBeans) + (ds_list_size(towers) * (childSupport / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
			if (tier4) {
				buffing[0].buffs[10] = (effect[1] - (ds_list_size(towers) * (effect[1] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[1] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
				buffing[0].buffs[11] = (effect[2] - (ds_list_size(towers) * (effect[2] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[2] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
				buffing[0].buffs[12] = (effect[3] - (ds_list_size(towers) * (effect[3] / 10) * notManyBeans) + (ds_list_size(towers) * (effect[3] / 10) * sweatshop)) * buffs[8] * multis[3] * (global.lesbians[towerType - 8] * lesbian + 1) * (array_contains(global.schizophrenics, buffing[0]) * 0.5 * psychiatrist + 1)
			}
			buffing[0].image_blend = c_blue
		}
	}
	else {
		buffing = []
	}
}