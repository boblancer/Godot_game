extends Node2D
var rect
var cell

var enemy_count  = 4;

func init():
	pass
func _ready():
	spawn_item()
	
	pass
func _process(delta):
	if enemy_count == 0:
		print("win")
		get_tree().change_scene('res://interface/Win.tscn')

		queue_free()
		enemy_count =1
func spawn_item():
	
	for i in range(2):
		randomize()		
		var crate = preload("res://Misc/Crate.tscn").instance()
		var vec = Vector2(randi() % 3000, randi() % 2000)
		crate.init(vec)
		add_child(crate)
		print("crate created" + str(vec))
	for i in range (3):
		randomize()		
		var tank = preload("res://resources/Tank/Enemy.tscn").instance()
		var vec = Vector2(randi() % 3000, randi() % 2000)
		tank.position = vec;
		add_child(tank)
		print("Enemy generated at " + str(vec))
		
		
func _on_EnemyTank_shoot(bullet, vec, direction):
	print("shoot")
	var b =  bullet.instance()
	b.start(vec,  direction)
	add_child(b)
	pass # Replace with function body.
