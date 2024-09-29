//duck you byond
var/global/image/stringbro = new() // Temporarily super-global because of BYOND init order dumbness.
var/global/image/iconbro = new() // Temporarily super-global because of BYOND init order dumbness.
var/global/image/appearance_bro = new() // Temporarily super-global because of BYOND init order dumbness.

// Items that ask to be called every cycle.
var/global/datum/datacore/data_core = null
var/global/list/all_areas                = list()
var/global/list/ship_areas                = list()


//var/global/list/machines                 = list()		//Removed
//var/global/list/processing_objects       = list()		//Removed
//var/global/list/processing_power_items   = list()		//Removed
var/global/list/active_diseases          = list()
var/global/list/med_hud_users            = list() // List of all entities using a medical HUD.
var/global/list/sec_hud_users            = list() // List of all entities using a security HUD.
var/global/list/hud_icon_reference       = list()


var/global/datum/universal_state/universe = new

var/global/list/global_map = null

// Noises made when hit while typing.
var/list/hit_appends = list("-OOF", "-ACK", "-UGH", "-HRNK", "-HURGH", "-GLORF")

var/start_time				= null

var/runtime_diary			= null
var/runtime_diary_filename	= null
var/diary					= null
var/diary_filename			= null
var/world_qdel_log			= null
var/href_logfile			= null
var/href_logfile_filename	= null
var/station_name			= "Junos Valley"
var/station_short			= "Junos"
var/const/dock_name			= "Amethyn"
var/const/boss_name			= "High Council"
var/const/boss_short		= "High Council"
var/const/company_name		= "Junos Valley"
var/const/company_short		= "Junos"
var/game_version			= "JunosValley"
var/changelog_hash			= ""
var/game_year				= (text2num(time2text(world.realtime, "YYYY")) + 629)

var/round_progressing = 1
var/master_storyteller       = "shitgenerator"

var/host = null //only here until check @ code\modules\ghosttrap\trap.dm:112 is fixed

var/list/bombers       = list()
var/list/admin_log     = list()
var/list/lastsignalers = list() // Keeps last 100 signals here in format: "[src] used \ref[src] @ location [src.loc]: [freq]/[code]"
var/list/lawchanges    = list() // Stores who uploaded laws to which silicon-based lifeform, and what the law was.
var/list/reg_dna       = list()

var/list/cardinal    = list(NORTH, SOUTH, EAST, WEST)
var/list/cornerdirs  = list(NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
var/list/alldirs     = list(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST)
var/list/reverse_dir = list( // reverse_dir[dir] = reverse of dir
	 2,  1,  3,  8, 10,  9, 11,  4,  6,  5,  7, 12, 14, 13, 15, 32, 34, 33, 35, 40, 42,
	41, 43, 36, 38, 37, 39, 44, 46, 45, 47, 16, 18, 17, 19, 24, 26, 25, 27, 20, 22, 21,
	23, 28, 30, 29, 31, 48, 50, 49, 51, 56, 58, 57, 59, 52, 54, 53, 55, 60, 62, 61, 63
)

var/datum/configuration/config      = null

var/Debug2 = 0

var/gravity_is_on = 1

var/server_ad = null
var/join_motd = null

var/list/awaydestinations = list() // Away missions. A list of landmarks that the warpgate can take you to.

// MySQL configuration
var/sqladdress
var/sqlport
var/sqldb
var/sqllogin
var/sqlpass

// For FTP requests. (i.e. downloading runtime logs.)
// However it'd be ok to use for accessing attack logs and such too, which are even laggier.
var/fileaccess_timer = 0
var/custom_event_msg = null

// Database connections. A connection is established on world creation.
// Ideally, the connection dies when the server restarts (After feedback logging.).
var/DBConnection/dbcon     = new() // Feedback    database (New database)

// Reference list for disposal sort junctions. Filled up by sorting junction's New()
/var/list/tagger_locations = list()

// Added for Xenoarchaeology, might be useful for other stuff.
var/global/list/alphabet_uppercase = list("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")




// Some scary sounds.
var/static/list/scarySounds = list(
	'sound/weapons/thudswoosh.ogg',
	'sound/weapons/energy/Taser.ogg',
	'sound/weapons/armbomb.ogg',
	'sound/voice/hiss1.ogg',
	'sound/voice/hiss2.ogg',
	'sound/voice/hiss3.ogg',
	'sound/voice/hiss4.ogg',
	'sound/voice/hiss5.ogg',
	'sound/voice/hiss6.ogg',
	'sound/effects/Glassbr1.ogg',
	'sound/effects/Glassbr2.ogg',
	'sound/effects/Glassbr3.ogg',
	'sound/items/Welder.ogg',
	'sound/items/Welder2.ogg',
	'sound/machines/airlock.ogg',
	'sound/effects/clownstep1.ogg',
	'sound/effects/clownstep2.ogg'
)

// Bomb cap!
var/max_explosion_range = 20

// Announcer intercom, because too much stuff creates an intercom for one message then hard del()s it.
var/global/obj/item/device/radio/intercom/global_announcer = new(null)


