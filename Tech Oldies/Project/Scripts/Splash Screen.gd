extends Node2D

var main_menu = preload("res://Scenes/Move The Mouse.tscn").instance()
onready var title_timer = $InitTimer
onready var splash_init = $SplashInit
onready var background = $Background
var already_done = false

func _ready():
	splash_init.z_index = 1
	background.z_index = 0

func initiate():
	if Input.is_action_pressed("ui_accept"):
		get_tree().get_root().add_child(main_menu)
		get_node("/root/SplashScreen").free()
	
func _process(delta):
	if title_timer.timer_done == true and already_done == false:
		already_done = true
		#"silly billy" contributed by Maddox Curren
		print("silly billy") 
		splash_init.z_index = 0
		background.z_index = 1
		print("goofy or pete")
		
	if already_done == true:
		initiate()
		
