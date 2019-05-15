extends Node2D

func _ready():
	$Actor.facing = "right"
	pass # Replace with function body.

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
