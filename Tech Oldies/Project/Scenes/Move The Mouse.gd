extends Node2D

var phys_mouse_pos = Vector2()
var clickedon = null
onready var mouse = $Mouse
onready var open = $Mouse/open
onready var lmb = $Mouse/left
onready var rmb = $Mouse/right
onready var scr = $Mouse/scroll
onready var click = $Mouse/clickzone

func _ready():
	#sets mouse to unclicked
	open.show()
	lmb.hide()
	rmb.hide()
	scr.hide()
	open.z_index = 4
	lmb.z_index = 3
	rmb.z_index = 2
	scr.z_index = 1
	
func lmb():
	clickedon = click.get_overlapping_areas()
	print(clickedon)
	
func rmb():
	pass

func scr():
	pass

func _process(delta):
	#moves mouse to the proper position
	phys_mouse_pos = get_viewport().get_mouse_position()
	print(phys_mouse_pos)
	mouse.position = phys_mouse_pos
	#click animation
	if Input.is_action_pressed("lmb"):
		lmb.show()
		open.hide()
		rmb.hide()
		scr.hide()
		lmb()
	elif Input.is_action_pressed("rmb"):
		lmb.hide()
		open.hide()
		rmb.show()
		scr.hide()
		rmb()
	elif Input.is_action_pressed("scr"):
		lmb.hide()
		open.hide()
		rmb.hide()
		scr.show()
		scr()
	else:
		lmb.hide()
		open.show()
		rmb.hide()
		scr.hide()
