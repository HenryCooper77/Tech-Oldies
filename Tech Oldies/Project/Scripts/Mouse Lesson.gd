extends Node2D

onready var blank = $Blank
onready var lmb = $Lmb
onready	var rmb = $Rmb
onready	var scr = $Scr

func _ready():
	blank.z_index = 4
	lmb.z_index = 3
	rmb.z_index = 2
	scr.z_index = 1
	
func _process(delta):
	if Input.is_action_just_released("lmb"):
		print("lmb")
	if Input.is_action_just_released("rmb"):
		print("rmb")
	if Input.is_action_just_released("scr"):
		print("scr")
