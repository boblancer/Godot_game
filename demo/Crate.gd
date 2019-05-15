extends Area2D

var object_name = "crate"
export (int) var Hp

# Called when the node enters the scene tree for the first time.
func _ready():
	if( randi() % 2 == 0):
		$AnimatedSprite.play("Metal")
		Hp = 100
	else:
		$AnimatedSprite.play("Wooden")
		Hp = 30
	
	print("crate randomize")
	pass # Replace with function body.

func init(pos):
	position = pos


func _on_Crate_area_entered(area):
	if area.object_name == "Bullet":
		Hp -= area.damage
		area.explode()
	print("damage taken")
	if Hp <= 0:
		var drop = preload('res://Misc/Pickup.tscn').instance()
		drop.init(position)
		get_parent().add_child(drop)
		queue_free()

