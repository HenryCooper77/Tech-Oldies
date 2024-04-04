extends Node2D
#NFL contribueted: Will Cowgur
var phys_mouse_pos = Vector2()
var clickedon = null
var typeofclick = null
#next lesson preload
#var homepage = preload("res://Scenes/HomePage.tscn").instance()
#mouse preloads
onready var mouse = $Mouse
onready var open = $Mouse/open
onready var leftmb = $Mouse/left
onready var rightmb = $Mouse/right
onready var scroll = $Mouse/scroll
onready var click = $Mouse/clickzone
#lesson button preloads
onready var mouselesson = $MouseLesson
onready var browserlesson = $BrowserLesson

func _ready():
	#sets mouse to unclicked
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	open.show()
	leftmb.hide()
	rightmb.hide()
	scroll.hide()
	mouselesson.show()
	browserlesson.show()
	mouse.show()
	
func lmb():
	if click.overlaps_body(mouselesson):
		#frongs contributed by Maddox Curren
		print("frongs:")
		typeofclick = "left"
		mouselessonpressed()
	elif click.overlaps_body(browserlesson):
		#sillier contributed by Maddox Curren
		print("sillier:")
		typeofclick = "left"
		browserlessonpressed()
		
func rmb():
	pass
	#if click.overlaps_body(blankmark):
		##frigglemousey contributed by Maddox Curren
		#print("frigglemousey:")
		#typeofclick = "right"
		#blankmarkrightpressed()
	
func notclicked():
	typeofclick = "null"

func mouselessonpressed():
	pass
	
func browserlessonpressed():
	pass

func finishlesson():
	pass
	##oh frigglehorns contributed by Maddox Curren
	#print("oh frigglehorns")
	#get_tree().get_root().add_child(homepage)
	#get_node("/root/Internet").call_deferred("free")
		
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
