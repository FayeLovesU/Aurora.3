/*
/obj/structure/sign/double/barsign
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "empty"
	anchored = 1
	var/cult = 0
	req_access = list(access_bar) //Has to initalize at first, this is updated by instance's req_access

/obj/structure/sign/double/barsign/proc/get_valid_states(initial=1)
	. = icon_states(icon)
	. -= "on"
	. -= "narsiebistro"
	. -= "empty"
	if(initial)
		. -= "Off"

/obj/structure/sign/double/barsign/examine(mob/user)
	..()
	switch(icon_state)
		if("Off")
			to_chat(user, "It appears to be switched off.")
		if("narsiebistro")
			to_chat(user, "It shows a picture of a large black and red being. Spooky!")
		if("on", "empty")
			to_chat(user, "The lights are on, but there's no picture.")
		else
			to_chat(user, "It says '[icon_state]'")

/obj/structure/sign/double/barsign/Initialize()
	. = ..()
	icon_state = pick(get_valid_states())

/obj/structure/sign/double/barsign/attackby(obj/item/I, mob/user)
	if(cult)
		return ..()

	var/obj/item/card/id/card = I.GetID()
	if(istype(card))
		if(check_access(card))
			var/sign_type = input(user, "What would you like to change the barsign to?") as null|anything in get_valid_states(0)
			if(!sign_type)
				return
			icon_state = sign_type
			to_chat(user, "<span class='notice'>You change the barsign.</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
		return

	return ..()
	*/

/obj/structure/sign/double/barsign
	icon = 'icons/obj/barsigns.dmi'
	icon_state = "Off"
	layer = 2.99
	anchored = TRUE
	req_access = list(access_bar) //Has to initalize at first, this is updated by instance's req_access
	var/cult = 0
	var/choice_types = /decl/sign/double/bar

/obj/structure/sign/double/barsign/kitchensign
	icon = 'icons/obj/kitchensigns.dmi'
	icon_state = "Off"
	req_access = list(access_kitchen)
	choice_types = /decl/sign/double/kitchen

/obj/structure/sign/double/barsign/attackby(obj/item/I, mob/user)
	if(cult)
		return ..()	
	var/obj/item/card/id/card = I.GetID()
	if(istype(card))
		if(check_access(card))
			set_sign()
			to_chat(user, "<span class='notice'>You change the sign.</span>")
		else
			to_chat(user, "<span class='warning'>Access denied.</span>")
		return

	return ..()

/decl/sign/double
	var/name = "Holographic Projector"
	var/icon_state = "Off"
	var/desc = "A holographic projector, displaying different saved themes. It is turned off right now."
	var/desc_fluff = "To change the displayed theme, use your bartender's or chef's ID on it and select something from the menu. There are two different selections for the bar and the kitchen."

/decl/sign/double/off // Here start the different bar signs. To add any new ones, just copy the format, make sure its in the .dmi and write away. -KingOfThePing
	name = "Holgraphic Projector"
	icon_state = "Off"
	desc = "A holographic projector, displaying different saved themes. It is turned off right now."
	desc_fluff = "To change the displayed theme, use your bartender's or chef's ID on it and select something from the menu. There are two different selections for the bar and the kitchen."

/decl/sign/double/bar/whiskey_implant
	name = "Whiskey Implant"
	icon_state = "Whiskey Implant"	
	desc = "A hit on modern extensive augmentations."
	desc_fluff = "Some people would probably argue, that an implant which injects you some whiskey in certain situations, would probably make the galaxy a better place for everyone."
/decl/sign/double/bar/the_drunk_carp
	name = "The Drunk Carp"
	icon_state = "The Drunk Carp"	
	desc = "A depiction of a stylized space carp drinking a beer."
	desc_fluff = "A depiction of 'Ivan the Space Carp' from the popular children's show of the same name. As the name suggests, Ivan has a heavy drinking problem."
/decl/sign/double/bar/the_outer_spess
	name = "The Outer Spess"
	icon_state = "The Outer Spess"	
	desc = "A long running joke between spacemen, which never gets old."
	desc_fluff = "It's almost tradition to call the great unknown of the universe 'spess'. No one really knows anymore where this joke comes from nor does anyone care. It's also not important, probably."
/decl/sign/double/bar/officer_beersky
	name = "Officer Beersky"
	icon_state = "Officer Beersky"	
	desc = "To remember the hero, lost along the way, Officer Beepsky."
	desc_fluff = "To commemorate the great accomplishments and never ending duty of the ISD's small security robot Officer Beepsky. Gone, but not forgotten."
/decl/sign/double/bar/ishimura
	name = "Ishimura"
	icon_state = "Ishimura"	
	desc = "Named after a famous solarian physicist."
	desc_fluff = "Hideki Ishimura was a famous solarian astrophysicist, responsible for some great scientific achievements from a time long gone."
/decl/sign/double/bar/foreign
	name = "Foreign"
	icon_state = "Foreign"	
	desc = "A sign, designed in a classic estern-asian design, originating from Earth."
	desc_fluff = "Earth's eastern asian culture brought forward a greatly varied and loved style of cuisine, still eaten today. This sign looks like one of the many signs that come to mind, when thinking about this."
/decl/sign/double/bar/hearts_of_plasteel
	name = "Hearts of Plasteel"
	icon_state = "Hearts of Plasteel"	
	desc = "The sign of a diner from a famous TV show."
	desc_fluff = "This sign is a replication of the diner sign, which the military-comedy show 'Hearts of Plasteel' revolves around. Loved by fans universe-wide."
/decl/sign/double/bar/the_lightbulb
	name = "The Lightbulb"
	icon_state = "The Lightbulb"	
	desc = "The Lightbulb, a famous scene-bar and club in Mendell City."
	desc_fluff = "The Lightbulb is one of the top hidden gems in Mendell City, if you want to party. Known for it's expansive dance floors and planet-wide renowned bartenders, the Lightbulb is a once in a lifetime experience."
/decl/sign/double/bar/chem_lab
	name = "Chem Lab"
	icon_state = "Chem Lab"	
	desc = "Chem Labs are the unofficial name given to some eridanian bars."
	desc_fluff = "Underground, hidden or less known bars in Eridani, where almost exclusively Dregs or other 'Unwanted' frequent are unofficially called Chem Labs, not only due to the dubious origin of the alcohol served there."
/decl/sign/double/bar/meow_mix
	name = "Meow Mix"
	icon_state = "Meow Mix"	
	desc = "A sign with a selection of some of the SCC's much beloved pets."
	desc_fluff = "Two cats, named Bones and Nickel are depicted on this sign. They are much beloved mascotts, raising morale and work efficiency whereever they are."
/decl/sign/double/bar/the_hive
	name = "The Hive"
	icon_state = "The Hive"	
	desc = "A wildly known, high class eridanian cocktail bar chain."
	desc_fluff = "The Hive, known for its expensive and extravagant drinks, this bar chain is known as the place to be with your suit friends, when visiting Epsilon Eridani."
/decl/sign/double/bar/mead_bay
	name = "Mead Bay"
	icon_state = "Mead Bay"	
	desc = "The Mead Bay is the alternative for visiting an actual Medbay."
	desc_fluff = "Another long running joke among spacefarers. A bandage from the Medbay may mend your body, but a good drink from the Mead Bay together with your colleagues really mends your soul."
/decl/sign/double/bar/toolbox_tavern
	name = "Toolbox Tavern"
	icon_state = "Toolbox Tavern"	
	desc = "A popular bar at an Hepheastus Industries shipyard."
	desc_fluff = "The name of the after-hours bar, located at the Hepheastus Industries shipyard the Horizon was built. To remember the great lengths and sacrifices that were made to bring this vessel to life."
/decl/sign/double/bar/maltese_falcon
	name = "Maltese Falcon"
	icon_state = "Maltese Falcon"	
	desc = "A recreation of the famous Maltese Falcon bar sign."
	desc_fluff = "An exact replica of the sign, which is hanging over the entrance of the famous Maltese Falcon Bar & Grill. A safe heaven for every pilot, captain or crewman of any vessel, looking to take a break."
/decl/sign/double/bar/old_cock_inn
	name = "Old Cock Inn"
	icon_state = "Old Cock Inn"	
	desc = "The sign of a formerly well-known discotheque."
	desc_fluff = "The Old Cock Inn was a discotheque, from times long gone. Formerly known as 'Old Richard's Inn' no one can remember much about it, but the name has persisted over the decades."
/decl/sign/double/bar/commie
	name = "People's Preferred"
	icon_state = "Commie"	
	desc = "The name of a bar, located at Pluto's biggest spaceport."
	desc_fluff = "People's Preferred is the name of the drinking hole at Pluto's biggest spaceport. Everyone stops there and everyone loves it there. It's what the people prefer, apparently."
/decl/sign/double/kitchen/event_horizon // Start of the kitchen signs. Don't mix it up.
	name = "Event Horizon"
	icon_state = "Event Horizon"
	desc = "The SCCV Horizon's kitchen franchise sign."
	desc_fluff = "The SCCV Horizon's dining area was the testing ground for the SCC to experiment with food franchising. The goal was to provide better food perparing processes, food quality and, of course, to maybe capitalize on this. To remember where it all started, the name 'Event Horizon' was chosen."

/obj/structure/sign/double/barsign/proc/get_sign_choices()
	var/list/sign_choices = decls_repository.get_decls_of_subtype(choice_types)
	return sign_choices

/obj/structure/sign/double/barsign/proc/set_sign()
    var/list/sign_choices = get_sign_choices()

    var/list/sign_index = list()
    for(var/sign in sign_choices)
        var/decl/sign/double/B = decls_repository.get_decl(sign)
        sign_index["[B.name]"] = B

    var/sign_choice = input("What should the sign be changed to?") as null|anything in sign_index
    if(!sign_choice)
        return
    var/decl/sign/double/signselect = sign_index[sign_choice]
    
    name = signselect.name
    desc = signselect.desc
    desc_fluff = signselect.desc_fluff
    icon_state = signselect.icon_state
    update_icon()
