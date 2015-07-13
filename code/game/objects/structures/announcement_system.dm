var/list/announcement_systems = list()

/obj/structure/announcement_system
	density = 0
	anchored = 1
	name = "\improper Automated Announcement System"
	desc = "An automated announcement system that handles minor announcements over the radio."
	icon = 'icons/obj/radio.dmi'
	icon_state = "beacon"
	var/obj/item/device/radio/headset/radio

/obj/structure/announcement_system/New()
	announcement_systems += src
	radio = new /obj/item/device/radio/headset/ai(src)

/obj/structure/announcement_system/proc/announce(message, channels)
	for(var/channel in channels)
		radio.talk_into(src, message, channel, list(SPAN_ROBOT))