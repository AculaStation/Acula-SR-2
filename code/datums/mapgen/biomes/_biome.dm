///This datum handles the transitioning from a turf to a specific biome, and handles spawning decorative structures and mobs.
/datum/biome
	///Type of turf this biome creates
	var/turf_type
	///Chance of having a structure from the flora types list spawn
	var/flora_density = 0
	///Chance of having a mob from the fauna types list spawn
	var/fauna_density = 0
	///list of type paths of objects that can be spawned when the turf spawns flora
	var/list/flora_types = list(/obj/structure/flora/grass/jungle/a/style_random)
	///list of type paths of mobs that can be spawned when the turf spawns fauna
	var/list/fauna_types = list()

///This proc handles the creation of a turf of a specific biome type
/datum/biome/proc/generate_turf(turf/gen_turf)
	gen_turf.ChangeTurf(turf_type, null, CHANGETURF_DEFER_CHANGE)
	if(length(fauna_types) && prob(fauna_density))
		var/mob/fauna = pick(fauna_types)
		new fauna(gen_turf)

	if(length(flora_types) && prob(flora_density))
		var/obj/structure/flora = pick(flora_types)
		new flora(gen_turf)

/datum/biome/mudlands
	turf_type = /turf/open/misc/dirt/jungle/dark
	flora_types = list(/obj/structure/flora/grass/jungle/a/style_random,/obj/structure/flora/grass/jungle/b/style_random, /obj/structure/flora/rock/pile/jungle/style_random, /obj/structure/flora/rock/pile/jungle/large/style_random)
	flora_density = 3

/datum/biome/plains
	turf_type = /turf/open/misc/grass/jungle
	flora_types = list(/obj/structure/flora/grass/jungle/a/style_random,/obj/structure/flora/grass/jungle/b/style_random, /obj/structure/flora/tree/jungle/style_random, /obj/structure/flora/rock/pile/jungle/style_random, /obj/structure/flora/bush/jungle/a/style_random, /obj/structure/flora/bush/jungle/b/style_random, /obj/structure/flora/bush/jungle/c/style_random, /obj/structure/flora/bush/large/style_random, /obj/structure/flora/rock/pile/jungle/large/style_random)
	flora_density = 15

/datum/biome/jungle
	turf_type = /turf/open/misc/grass/jungle
	flora_types = list(/obj/structure/flora/grass/jungle/a/style_random,/obj/structure/flora/grass/jungle/b/style_random, /obj/structure/flora/tree/jungle/style_random, /obj/structure/flora/rock/pile/jungle/style_random, /obj/structure/flora/bush/jungle/a/style_random, /obj/structure/flora/bush/jungle/b/style_random, /obj/structure/flora/bush/jungle/c/style_random, /obj/structure/flora/bush/large/style_random, /obj/structure/flora/rock/pile/jungle/large/style_random)
	flora_density = 40

/datum/biome/jungle/deep
	flora_density = 65

/datum/biome/wasteland
	turf_type = /turf/open/misc/dirt/jungle/wasteland

/datum/biome/water
	turf_type = /turf/open/water/jungle

/datum/biome/mountain
	turf_type = /turf/closed/mineral/random/jungle
