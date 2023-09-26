extends Node2D

onready var blank = $Blank
onready var lmb = $Lmb
onready	var rmb = $Rmb
onready	var scr = $Scr

func _ready():
	lmb.hide()
	rmb.hide()
	scr.hide()
	lmb.z_index = 3
	rmb.z_index = 2
	scr.z_index = 1
	blank.z_index = 0
	
func _process(delta):
	if Input.is_action_pressed("lmb"):
		print("lmb")
		lmb.show()
	else:
		lmb.hide()
	if Input.is_action_pressed("rmb"):
		print("rmb")
		rmb.show()
	else:
		lmb.hide()
	if Input.is_action_pressed("scr"):
		print("scr")
		rmb.show()
	else:
		scr.hide()
