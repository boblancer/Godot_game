extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Actor.facing = "right"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Player_is_walking(node, direction):
	
	if direction != 0:
		$Actor.play("run")
		$Actor.timer.start()
		if direction == 2:
			if $Actor.facing == "left":
				$Actor.facing = "right"
				$Actor.flip_h = true
				$Gun.set_flip_v(true)
				$Gun.set_offset(Vector2(35,-25))
						
		elif direction == 1:
			if $Actor.facing == "right":
				$Actor.facing = "left"
				$Actor.flip_h = false
				$Gun.set_flip_v(false)		
				$Gun.set_offset(Vector2(35, 0))
				
	else:
		$Actor.timer.start()
		$Actor.play("run")
	pass # Replace with function body.
