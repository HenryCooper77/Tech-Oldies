extends Timer

var timer_done = false

func _ready():
	#"glorbus" contributed by Maddox Curren
	print("glorbus")
	wait_time = 5
	one_shot = true
	autostart = true
func _process(delta):
	if time_left == 0:
		timer_done = true
