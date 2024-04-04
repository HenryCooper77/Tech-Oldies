extends Node2D

var phys_mouse_pos = Vector2()
var clickedon = null
var typeofclick = null
var settingstogglestate = 0
var soundtogglestate = 1
var wallcycle = 1
var tutorialcycle = 1
var searchterm = null
var completion1 = 0
var completion2 = 0
var completion3 = 0
var leavable = false
#next lesson preload
var email = preload("res://Scenes/Email.tscn").instance()
#mouse preloads
onready var mouse = $Mouse
onready var open = $Mouse/open
onready var leftmb = $Mouse/left
onready var rightmb = $Mouse/right
onready var scroll = $Mouse/scroll
onready var click = $Mouse/clickzone
#bookmarks bar preloads
onready var blankmark = $HomePage/BlankBookmark
onready var catmark = $HomePage/CatPicturesBookmark
#music preloads
onready var music = $Music
#cat website preload
onready var catsite = $CatPicturesSite/Body
onready var closecatsite = $CatPicturesSite/Close
#tutorial text preloads
onready var bookmarks = $HomePage/HomeGuides/Bookmarks
onready var exittext = $HomePage/HomeGuides/Exit
#search bar preloads
onready var searchbutton = $HomePage/Search
onready var searchbar = $HomePage/SearchBar
#info website preloads
onready var infosite = $Info/Body
onready var closeinfosite = $Info/Close
#leave lesson preloads
onready var closelesson = $HomePage/LeaveLesson

func _ready():
	#sets mouse to unclicked
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	open.show()
	leftmb.hide()
	rightmb.hide()
	scroll.hide()
	catsite.hide()
	closecatsite.hide()
	infosite.hide()
	closeinfosite.hide()
	bookmarks.show()
	exittext.hide()
	if GlobalVariables.musicchoice == "play":
		music.play()
		music.autoplay = true
	elif GlobalVariables.musicchoice == "do not play":
		music.stop()
		music.autoplay = false
	
func lmb():
	if click.overlaps_body(blankmark):
		#mousey contributed by Maddox Curren
		print("mousey:")
		typeofclick = "left"
		blankmarkpressed()
	elif click.overlaps_body(catmark):
		#cantwaittomeetyou contributed by Maddox Curren
		print("cantwaittomeetyou:")
		typeofclick = "left"
		catmarkpressed()
	elif click.overlaps_body(closecatsite):
		#Flaberghasted contributed by Elliott Frank
		print("Flaberghasted:")
		typeofclick = "left"
		closethecatsite()
	elif click.overlaps_body(searchbutton):
		#cheezburger contributed by Maddox Curren
		print("cheezburger:")
		typeofclick = "left"
		search()
		
func rmb():
	if click.overlaps_body(blankmark):
		#frigglemousey contributed by Maddox Curren
		print("frigglemousey:")
		typeofclick = "right"
		blankmarkrightpressed()
	elif click.overlaps_body(catmark):
		#sillygoose contributed by Maddox Curren
		print("sillygoose:")
		typeofclick = "right"
		catmarkpressed()
	elif click.overlaps_body(closecatsite):
		#flibberdoodle contributed by Elliott Frank
		print("flibberdoodle:")
		typeofclick = "right"
		closethecatsite()
	elif click.overlaps_body(searchbutton):
		#ahhhhh contributed by Maddox Curren
		print("ahhhhh:")
		typeofclick = "right"
		search()
	
func notclicked():
	typeofclick = "null"
	
func blankmarkpressed():
	if tutorialcycle == 1:
		tutorialcycle = 2
	infosite.show()
	closeinfosite.show()
	completion1 = 1

func blankmarkrightpressed():
	pass
	
func catmarkpressed():
	if tutorialcycle == 1:
		tutorialcycle = 2
	catsite.show()
	completion2 = 1
	
func catmarkrightpressed():
	pass
		
func closethecatsite():
	catsite.hide()
	closecatsite.hide()
	infosite.hide()
	closeinfosite.hide()

func search():
	searchterm = searchbar.get_text()
	OS.shell_open("https://www.google.com/search?q="+searchterm+"&sca_esv=583112150&source=hp&ei=nIBWZeSqJ-6rqtsP14qTuAI&iflsig=AO6bgOgAAAAAZVaOrdMRfHgSxkwVO0Cw4aPbWWuHScj4&ved=0ahUKEwjk6NjfssmCAxXulWoFHVfFBCcQ4dUDCAw&uact=5&oq=godot&gs_lp=Egdnd3Mtd2l6IgVnb2RvdDILEAAYgAQYsQMYgwEyCBAAGIAEGLEDMgsQABiABBixAxiDATILEAAYgAQYsQMYgwEyCxAAGIAEGLEDGIMBMggQABiABBixAzIIEAAYgAQYsQMyCxAAGIAEGLEDGIMBMgsQABiABBixAxiDATIIEAAYgAQYsQNIz70BUMq1AVinugFwAHgAkAEAmAGUCqABkBWqAQ0wLjEuNC0xLjAuMS4xuAEDyAEA-AEBqAIKwgIQEAAYAxiPARjlAhjqAhiMA8ICEBAuGAMYjwEY5QIY6gIYjAPCAhEQLhiABBixAxiDARjHARjRAw&sclient=gws-wiz")
	completion3 = 1
	
func unlockexit():
	exittext.show()
	leavable = true
		
func finishlesson():
	#oh frigglehorns contributed by Maddox Curren
	print("oh frigglehorns")
	get_tree().get_root().add_child(email)
	get_node("/root/Internet").call_deferred("free")
		
func _process(delta):
	if Input.is_action_just_released("Search"):
		search()
	#tutorial cycler
	if tutorialcycle == 1:
		bookmarks.show()
	elif tutorialcycle == 2:
		bookmarks.hide()
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
	#completion tracker
	if completion1 + completion2 + completion3 == 3 or Input.is_action_just_pressed("debug mode"):
		unlockexit()
	if leavable == true and Input.is_action_pressed("lmb") and click.overlaps_body(closelesson):
		finishlesson()
