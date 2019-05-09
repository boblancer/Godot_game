extends Camera2D

# var b = "text"

func _ready():
	set_camera_limits()

func set_camera_limits():
	
	limit_left = 0
	limit_right =  3328
	limit_top = 0
	limit_bottom = 2304
