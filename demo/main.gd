extends Node2D

export (PackedScene) var Global_bullet

func _on_KinematicBody2D_position_changed(node, new_pos):
	print(str(new_pos))


func _on_Player_shoot(position, direction):
	var b = Global_bullet.instance()
	add_child(b)
	var random_spread = rand_range(-0.1 , 0.1)
	#b.start(position, direction)
	b.start(position, Vector2(1,0).rotated(direction + random_spread ))
	
	pass # Replace with function body.

func _on_Player_debug_message(node, debug):
	print(str(debug))
	pass # Replace with function body.


func _on_Gun_Timer_timeout():
	print("Gun timeout ")
	pass # Replace with function body.
