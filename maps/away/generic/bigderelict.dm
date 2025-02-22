/datum/map_template/ruin/away_site/big_derelict
	name = "large derelict"
	description = "A very large derelict station. According to the starmap, it shouldn't exist."
	suffix = "generic/bigderelict.dmm"
	sectors = list(SECTOR_TAU_CETI, SECTOR_ROMANOVICH, SECTOR_CORP_ZONE)
	spawn_weight = 1
	spawn_cost = 2
	id = "big_derelict"

/decl/submap_archetype/big_derelict
	map = "large derelict"
	descriptor = "A very large derelict station. According to the starmap, it shouldn't exist."

/obj/effect/overmap/visitable/sector/big_derelict
	name = "large derelict"
	desc = "A very large derelict station. According to the starmap, it shouldn't exist."

