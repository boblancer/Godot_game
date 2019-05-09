extends Node2D
var rect
var cell

func init():
	#$GUI/Nickname.text = nickname
	#global_position = start_position
	pass
func _ready():
	spawn_item()
	
	pass

func spawn_item():
	
	for i in range(2):
		randomize()		
		var crate = preload("res://Misc/Crate.tscn").instance()
		var vec = Vector2(randi() % 3000, randi() % 2000)
		crate.init(vec)
		add_child(crate)
		print("crate created" + str(vec))
		
func _on_EnemyTank_shoot(bullet, vec, direction):
	print("shoot")
	var b =  bullet.instance()
	b.start(vec,  direction)
	add_child(b)
	pass # Replace with function body.
