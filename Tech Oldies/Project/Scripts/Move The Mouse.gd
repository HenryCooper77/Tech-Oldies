extends Node2D

var phys_mouse_pos = Vector2()
var clickedon = null
var typeofclick = null
var settingstogglestate = 0
var soundtogglestate = 1
var wallcycle = 1
#next lesson preload
var internet = preload("res://Scenes/Internet.tscn").instance()
#wallpaper preloads
onready var wall1 = $wallpaper1
onready var wall2 = $wallpaper2
onready var wall3 = $wallpaper3
#mouse preloads
onready var mouse = $Mouse
onready var open = $Mouse/open
onready var leftmb = $Mouse/left
onready var rightmb = $Mouse/right
onready var scroll = $Mouse/scroll
onready var click = $Mouse/clickzone
#testapp preloads
onready var defaultappicon = $TestAppIcon
onready var defaultapp = $TestApp
onready var closedefaultapp = $TestApp/Close
#settings toggle
onready var settingstoggle = $TestApp/SettingsToggle
onready var toggleoffsprite = $TestApp/SettingsToggle/Off
onready var toggleonsprite = $TestApp/SettingsToggle/On
onready var settingstogglecollide = $TestApp/SettingsToggle/ToggleCollide
#settingsapp preload
onready var settingsappicon = $SettingsAppIcon
onready var settingsapp = $SettingsApp
onready var closesettingsapp = $SettingsApp/Close
#music toggle preloads
onready var musictoggle = $SettingsApp/SoundToggle
onready var musictogglecollider = $SettingsApp/SoundToggle/ToggleCollide
onready var musicspriteoff = $SettingsApp/SoundToggle/Off
onready var musicspriteon = $SettingsApp/SoundToggle/On
onready var music = $Music
#wallpaper toggler preloads
onready var wallswapbutton = $SettingsApp/WallpaperSwap
onready var swapsprite1 = $SettingsApp/WallpaperSwap/one
onready var swapsprite2 = $SettingsApp/WallpaperSwap/two
onready var swapsprite3 = $SettingsApp/WallpaperSwap/three
onready var swapcollider = $SettingsApp/WallpaperSwap/collider
#finish lesson preloads
onready var finishlesson = $SettingsApp/FinishLesson
onready var finishlessonoff = $SettingsApp/FinishLesson/Off
onready var finishlessonon = $SettingsApp/FinishLesson/On
onready var finishlessoncollider = $SettingsApp/FinishLesson/ToggleCollide

func _ready():
	#sets mouse to unclicked
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	open.show()
	leftmb.hide()
	rightmb.hide()
	scroll.hide()
	defaultapp.hide()
	settingsapp.hide()
	toggleoffsprite.show()
	musicspriteoff.hide()
	musicspriteon.show()
	toggleonsprite.hide()
	settingsappicon.hide()
	swapsprite1.show()
	swapsprite2.hide()
	swapsprite3.hide()
	wall1.show()
	wall2.hide()
	wall3.hide()
	settingstogglecollide.disabled = true
	musictogglecollider.disabled = true
	open.z_index = 14
	leftmb.z_index = 13
	rightmb.z_index = 12
	scroll.z_index = 11
	music.play()
	music.autoplay = true
	
func lmb():
	if click.overlaps_body(defaultappicon):
		#picklebear contributed by Maddox Curren
		print("picklebear:")
		typeofclick = "left"
		clickedapp()
	elif click.overlaps_body(closedefaultapp):
		#flegitbear contributed by Maddox Curren
		print("flegitbear:")
		typeofclick = "left"
		closedapp()
	elif click.overlaps_body(settingstoggle):
		#frigglehair contributed by Maddox Curren
		print("frigglehair:")
		settingstoggler()
	elif click.overlaps_body(settingsappicon):
		#riggletoo contributed by Maddox Curren
		print("riggletoo:")
		settingsopen()
	elif click.overlaps_body(closesettingsapp):
		#dooglesheegle contributed by Maddox Curren
		print("dooglesheegle:")
		closedsettings()
	elif click.overlaps_body(musictoggle):
		#hobbletory contributed by Maddox Curren
		print("hobbletory:")
		soundtoggle()
	elif click.overlaps_body(wallswapbutton):
		#fleegledeegle contributed by Maddox Curren
		print("fleegledeegle:")
		nextwallpaper()
	elif click.overlaps_body(finishlesson):
		#freddyfiggletorcol contributed by Maddox Curren
		print("freddyfiggletorcol:")
		finishlesson()
		
func rmb():
	if click.overlaps_body(defaultappicon):
		#teachereatingchildren contributed by Maddox Curren
		print("teachereatingchildren:")
		typeofclick = "right"
		clickedapp()
	elif click.overlaps_body(closedefaultapp):
		#fredrick figglebear contributed by Maddox Curren
		print("fredrick figglebear:")
		typeofclick = "right"
		closedapp()
	
func notclicked():
	typeofclick = "null"
	
func clickedapp():
	#shnoogle contributed by Maddox Curren
	print("shnoogle", typeofclick)
	defaultapp.show()
	settingstogglecollide.disabled = false

func closedapp():
		defaultapp.hide()
		settingstogglecollide.disabled = true
		
func settingstoggler():
	if settingstogglestate == 0:
		settingstogglestate = 1
		toggleoffsprite.hide()
		toggleonsprite.show()
		settingsappicon.show()
	elif settingstogglestate == 1:
		settingstogglestate = 0
		toggleonsprite.hide()
		toggleoffsprite.show()
		settingsappicon.hide()
	
func settingsopen():
	#liggledoogle contributed by Maddox Curren
	print("liggledoogle", typeofclick)
	settingsapp.show()
	musictogglecollider.disabled = false
	
func closedsettings():
	settingsapp.hide()
	musictogglecollider.disabled = true

func soundtoggle():
	if soundtogglestate == 0:
		soundtogglestate = 1
		musicspriteoff.hide()
		musicspriteon.show()
		music.play()
		music.autoplay = true
		GlobalVariables.musicchoice = "play"
	elif soundtogglestate == 1:
		soundtogglestate = 0
		musicspriteon.hide()
		musicspriteoff.show()
		music.stop()
		music.autoplay = false
		GlobalVariables.musicchoice = "do not play"

func nextwallpaper():
	if wallcycle < 3:
		wallcycle = wallcycle + 1
	elif wallcycle >= 3:
		wallcycle = 1
	if wallcycle == 1:
		swapsprite1.show()
		swapsprite2.hide()
		swapsprite3.hide()
		wall1.show()
		wall2.hide()
		wall3.hide()
	elif wallcycle == 2:
		swapsprite2.show()
		swapsprite1.hide()
		swapsprite3.hide()
		wall2.show()
		wall1.hide()
		wall3.hide()
	elif wallcycle == 3:
		swapsprite3.show()
		swapsprite2.hide()
		swapsprite1.hide()
		wall3.show()
		wall2.hide()
		wall1.hide()
		
func finishlesson():
	get_tree().get_root().add_child(internet)
	hide()
		
func _process(delta):
	#moves mouse to the proper position
	phys_mouse_pos = get_viewport().get_mouse_position()
	mouse.position = phys_mouse_pos
	#click animation
	if Input.is_action_pressed("lmb"):
		leftmb.show()
		open.hide()
		rightmb.hide()
		scroll.hide()
	elif Input.is_action_pressed("rmb"):
		leftmb.hide()
		open.hide()
		rightmb.show()
		scroll.hide()
	elif Input.is_action_pressed("scr"):
		leftmb.hide()
		open.hide()
		rightmb.hide()
		scroll.show()
	else:
		leftmb.hide()
		open.show()
		rightmb.hide()
		scroll.hide()
	#click funtion
	if Input.is_action_just_released("lmb"):	
		lmb()
	elif Input.is_action_just_released("rmb"):
		rmb()
	else:
		notclicked()
	if Input.is_action_pressed("debug mode"):
		GlobalVariables.debugmode = true
	if GlobalVariables.debugmode == true:
		music.stop()
