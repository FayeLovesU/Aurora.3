/datum/map_template/ruin/away_site/orion_express_ship
	name = "Orion Express Ship"
	description = "An unarmed and extremely prolific design of large, self-sufficient shuttle, prized for its modularity. Found all throughout the spur, the Yak-class shuttle can be configured to conceivably serve in any role, though it is only rarely armed with ship-to-ship weapons. Manufactured by Hephaestus. This one’s transponder identifies it as an Orion Express courier vessel."
	suffix = "ships/orion_express_ship.dmm"
	sectors = list(SECTOR_TAU_CETI, SECTOR_ROMANOVICH, SECTOR_CORP_ZONE)
	spawn_weight = 1
	spawn_cost = 1
	id = "orion_express_ship"
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/orion_express_shuttle)

/decl/submap_archetype/orion_express_ship
	map = "Orion Express ship"
	descriptor = "An unarmed and extremely prolific design of large, self-sufficient shuttle, prized for its modularity. Found all throughout the spur, the Yak-class shuttle can be configured to conceivably serve in any role, though it is only rarely armed with ship-to-ship weapons. Manufactured by Hephaestus. This one’s transponder identifies it as an Orion Express courier vessel."

//areas
/area/ship/orion_express_ship
	name = "Orion Express Ship"

/area/shuttle/orion_express_shuttle
	name = "Orion Express Shuttle"
	icon_state = "shuttle2"

//ship stuff

/obj/effect/overmap/visitable/ship/orion_express_ship
	name = "Orion Express Ship"
	desc = "An unarmed and extremely prolific design of large, self-sufficient shuttle, prized for its modularity. Found all throughout the spur, the Yak-class shuttle can be configured to conceivably serve in any role, though it is only rarely armed with ship-to-ship weapons. Manufactured by Hephaestus. This one’s transponder identifies it as an Orion Express courier vessel."
	icon_state = "shuttle"
	moving_state = "shuttle_moving"	
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	vessel_size = SHIP_SIZE_SMALL
	fore_dir = SOUTH
	initial_restricted_waypoints = list(
		"Orion Express Shuttle" = list("nav_hangar_orion_express")
	)

	initial_generic_waypoints = list(
		"nav_orion_express_ship_1",
		"nav_orion_express_ship_2"
	)

/obj/effect/overmap/visitable/ship/orion_express_ship/New()
	name = "OEV [pick("Messenger", "Traveler", "Highspeed", "Punctual", "Unstoppable", "Pony Express", "Courier", "Telegram", "Carrier Pigeon")]"
	..()

/obj/effect/shuttle_landmark/orion_express_ship/nav1
	name = "Orion Express Ship - Port Side"
	landmark_tag = "nav_orion_express_ship_1"
	base_turf = /turf/space/dynamic
	base_area = /area/space

/obj/effect/shuttle_landmark/orion_express_ship/nav2
	name = "Orion Express Ship - Port Airlock"
	landmark_tag = "nav_orion_express_ship_2"
	base_turf = /turf/space/dynamic
	base_area = /area/space

/obj/effect/shuttle_landmark/orion_express_ship/transit
	name = "In transit"
	landmark_tag = "nav_transit_orion_express_ship"
	base_turf = /turf/space/transit/south

//shuttle stuff
/obj/effect/overmap/visitable/ship/landable/orion_express_shuttle
	name = "Orion Express Shuttle"
	desc = "An inefficient design of ultra-light shuttle known as the Wisp-class. Its only redeeming features are the extreme cheapness of the design and the ease of finding replacement parts. Manufactured by Hephaestus. This one’s transponder identifies it as belonging to Orion Express."
	shuttle = "Orion Express Shuttle"
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 3000 //very inefficient pod
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_TINY

/obj/machinery/computer/shuttle_control/explore/orion_express_shuttle
	name = "shuttle control console"
	shuttle_tag = "Orion Express Shuttle"
	req_access = list(access_orion_express_ship)

/datum/shuttle/autodock/overmap/orion_express_shuttle
	name = "Orion Express Shuttle"
	move_time = 20
	shuttle_area = list(/area/shuttle/orion_express_shuttle)
	current_location = "nav_hangar_orion_express"
	landmark_transition = "nav_transit_orion_express"
	range = 1
	fuel_consumption = 2
	logging_home_tag = "nav_hangar_orion_express"
	defer_initialisation = TRUE

/obj/effect/shuttle_landmark/orion_express_shuttle/hangar
	name = "Orion Express Shuttle Hangar"
	landmark_tag = "nav_hangar_orion_express"
	docking_controller = "orion_express_shuttle_dock"
	base_area = /area/ship/orion_express_ship
	base_turf = /turf/simulated/floor/plating
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/shuttle_landmark/orion_express_shuttle/transit
	name = "In transit"
	landmark_tag = "nav_transit_orion_express"
	base_turf = /turf/space/transit/south

//ee ship

/datum/map_template/ruin/away_site/ee_spy_ship
	name = "Einstein Engines Research Ship"
	description = "A research ship belonging to Einstein Engines, the Stellar Corporate Conglomerate's main competitor."
	suffix = "ships/ee_spy_ship.dmm"
	sectors = list(SECTOR_TAU_CETI, SECTOR_ROMANOVICH, SECTOR_CORP_ZONE)
	spawn_weight = 1
	spawn_cost = 1
	id = "ee_spy_ship"
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/ee_shuttle)

/decl/submap_archetype/ee_spy_ship
	map = "Einstein Engines Research Ship"
	descriptor = "A research ship belonging to Einstein Engines, the Stellar Corporate Conglomerate's main competitor."

//areas
/area/ship/ee_spy_ship
	name = "Einstein Engines Research Ship"

/area/shuttle/ee_shuttle
	name = "Einstein Engines Shuttle"
	icon_state = "shuttle2"

//ship stuff

/obj/effect/overmap/visitable/ship/ee_spy_ship
	name = "Einstein Engines Research Ship"
	desc = "A research ship belonging to Einstein Engines, the Stellar Corporate Conglomerate's main competitor."
	icon_state = "shuttle"
	moving_state = "shuttle_moving"	
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_SMALL
	initial_restricted_waypoints = list(
		"Einstein Engines Shuttle" = list("nav_hangar_ee")
	)

	initial_generic_waypoints = list(
		"nav_ee_spy_ship_1",
		"nav_ee_spy_ship_2"
	)

/obj/effect/overmap/visitable/ship/ee_spy_ship/New()
	name = "EERV [pick("Brilliance", "Oppenheimer", "Fermi", "Slingshot", "Shanghai", "Bern", "Hadron", "Positron", "Invention", "Nikola Tesla", "Quark")]"
	..()

/obj/effect/shuttle_landmark/ee_spy_ship/nav1
	name = "Einstein Engines Research Ship - Port Side"
	landmark_tag = "nav_ee_spy_ship_1"
	base_turf = /turf/space/dynamic
	base_area = /area/space

/obj/effect/shuttle_landmark/ee_spy_ship/nav2
	name = "Einstein Engines Research Ship - Port Airlock"
	landmark_tag = "nav_ee_spy_ship_2"
	base_turf = /turf/space/dynamic
	base_area = /area/space

/obj/effect/shuttle_landmark/ee_spy_ship/transit
	name = "In transit"
	landmark_tag = "nav_transit_ee_spy_ship"
	base_turf = /turf/space/transit/south

//shuttle stuff
/obj/effect/overmap/visitable/ship/landable/ee_shuttle
	name = "Einstein Engines Shuttle"
	desc = "A shuttle used by Einstein Engines. For research purposes only."
	shuttle = "Einstein Engines Shuttle"
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 3000 //very inefficient pod
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_TINY

/obj/machinery/computer/shuttle_control/explore/ee_shuttle
	name = "shuttle control console"
	shuttle_tag = "Einstein Engines Shuttle"
	req_access = list(access_ee_spy_ship)

/datum/shuttle/autodock/overmap/ee_shuttle
	name = "Einstein Engines Shuttle"
	move_time = 20
	shuttle_area = list(/area/shuttle/ee_shuttle)
	current_location = "nav_hangar_ee"
	landmark_transition = "nav_transit_ee_shuttle"
	range = 1
	fuel_consumption = 2
	logging_home_tag = "nav_hangar_ee"
	defer_initialisation = TRUE

/obj/effect/shuttle_landmark/ee_shuttle/hangar
	name = "Einstein Engines Shuttle Hangar"
	landmark_tag = "nav_hangar_ee"
	docking_controller = "ee_shuttle_dock"
	base_area = /area/ship/ee_spy_ship
	base_turf = /turf/simulated/floor/plating
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/effect/shuttle_landmark/ee_shuttle/transit
	name = "In transit"
	landmark_tag = "nav_transit_ee_shuttle"
	base_turf = /turf/space/transit/south
