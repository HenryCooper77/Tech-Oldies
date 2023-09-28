extends Node2D

var phys_mouse_pos = Vector2()
var clickedon = null
var typeofclick = null
onready var mouse = $Mouse
onready var open = $Mouse/open
onready var leftmb = $Mouse/left
onready var rightmb = $Mouse/right
onready var scroll = $Mouse/scroll
onready var click = $Mouse/clickzone
onready var testapp = $TestApp

func _ready():
	#sets mouse to unclicked
	open.show()
	leftmb.hide()
	rightmb.hide()
	scroll.hide()
	open.z_index = 4
	leftmb.z_index = 3
	rightmb.z_index = 2
	scroll.z_index = 1
	
func lmb():
	if click.overlaps_body(testapp):
		#picklebear contributed by Maddox Curren
		print("picklebear:")
		typeofclick = "left"
		clickedapp()

func rmb():
	if click.overlaps_body(testapp):
		#teachereatingchildren contributed by Maddox Curren
		print("teachereatingchildren:")
		typeofclick = "right"
		clickedapp()
	
func notclicked():
	typeofclick = "null"
	
func clickedapp():
	#shnoogle contributed by Maddox Curren
	print("shnoogle", typeofclick)
		
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
