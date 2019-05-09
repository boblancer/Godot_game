extends Node2D

export (PackedScene) var Global_bullet
export (int) var damage
slave var slave_position = Vector2()
slave var slave_velocity = Vector2()

func init(pos, player_name , is_slave):
	if(is_network_master()):
		set_position(pos)
		$Player.set_position(pos)
		print("is master")
		slave_position =  pos
		
	print("pos" + str(pos)) 
	$Player/GUI/Nickname.set_text(player_name)
	
	
func _ready():
	if($Player.has_method('take_damage')):
		print("have method")
	
func set_camera_limits(map_limits, map_cellsize):
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	
func _on_KinematicBody2D_position_changed(node, new_pos):
	print(str(new_pos))
	
func _physics_process(delta):
	if(is_network_master()):
		$Player/Controller/Gun.look_at(get_global_mouse_position())
		
func _on_Player_shoot(position, direction):
	var b = Global_bullet.instance()
	add_child(b)
	
	var random_spread = rand_range(-0.05 , 0.05)
	var random_spawnX = rand_range(-15 , 15)
	var random_spawnY = rand_range(-15 , 15)
	#b.start(position, direction)
	b.start(Vector2(position.x + random_spawnX, position.y + random_spawnY ), Vector2(1,0).rotated(direction + random_spread ))
	
	pass # Replace with function body.

func _on_Player_debug_message(node, debug):
	print(str(debug))
	pass # Replace with function body.


func _on_Gun_Timer_timeout():
	#print("Gun timeout ")
	pass # Replace with function body.

func _on_Player_velocity_changed(node, debug):
	$Player.move_and_slide(debug)
	#position = debug
	rset('slave_position', position)
	rset('slave_velocity', debug)
	slave_position = position
	if get_tree().is_network_server():
		Network.update_position(int(name), position)
		
	pass # Replace with function body.


func _on_Player_move_slave(node):
	$Player.move_and_slide(slave_velocity)
	#position = slave_position
	
	if get_tree().is_network_server():
		Network.update_position(int(name), position)
	pass # Replace with function body.


func _on_Player_update_GUI(Hp):
	print(str($Player.hp))
	$Player/GUI/HealthBar.set_value(Hp)
	if($Player.hp <= 0):
		get_tree().change_scene('res://interface/GameOver.tscn')
		
	pass # Replace with function body.
