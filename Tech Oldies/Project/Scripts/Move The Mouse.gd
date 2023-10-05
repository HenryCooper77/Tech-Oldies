extends Node2D

var phys_mouse_pos = Vector2()
var clickedon = null
var typeofclick = null
var togglestate = 0
onready var mouse = $Mouse
onready var open = $Mouse/open
onready var leftmb = $Mouse/left
onready var rightmb = $Mouse/right
onready var scroll = $Mouse/scroll
onready var click = $Mouse/clickzone
onready var defaultappicon = $TestAppIcon
onready var defaultapp = $TestApp
onready var closedefaultapp = $TestApp/Close
onready var toggle = $TestApp/Toggle

func _ready():
	#sets mouse to unclicked
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	open.show()
	leftmb.hide()
	rightmb.hide()
	scroll.hide()
	defaultapp.hide()
	open.z_index = 14
	leftmb.z_index = 13
	rightmb.z_index = 12
	scroll.z_index = 11
	
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
	elif click.overlaps_body(toggle):
		#frigglehair contributed by Maddox Curren
		print("frigglehair:")
		toggle()

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

func closedapp():
		defaultapp.hide()
		
func toggle():
	if togglestate == 0:
		togglestate = 1
		#change the sprite
	elif togglestate == 1:
		togglestate = 0
		#change the sprite
	
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
