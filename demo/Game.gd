extends Node

func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('server_disconnected', self, '_on_server_disconnected')
	
	var new_player = preload('res://Player.tscn').instance()
	var map = preload('res://Map01.tscn').instance()
	new_player.name = str(get_tree().get_network_unique_id())
	new_player.set_network_master(get_tree().get_network_unique_id())
	add_child(map)
	#add_child(new_player)
	var info = Network.self_data
	#map.add_child(new_player)
	new_player.init(Vector2(1500,800), info.name, false)
	
func spawn_item():
	for i in range(3):
		var crate = preload("res://Misc/Crate.tscn").instance()
		var vec = Vector2(randi() % 3000, randi() % 2000)
		crate.init(vec)
		add_child(crate)
		print("crate created" + str(vec))
		
			
func _on_player_disconnected(id):
	get_node(str(id)).queue_free()

func _on_server_disconnected():
	
	get_tree().change_scene('res://interface/GameOver.tscn')

func _on_Tank_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)