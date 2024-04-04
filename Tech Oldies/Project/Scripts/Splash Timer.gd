extends KinematicBody2D

onready var timer = $Timer
var timer_done = false
var hidden = false

func _ready():
	timer.wait_time = 2
	timer.one_shot = true
	timer.autostart = true
	show()
func _process(delta):
	if timer.time_left == 0 and hidden == false:
		timer_done = true
		hide()
		#"glorbus" contributed by Maddox Curren
		print("glorbus")
		hidden = true
