extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	var test = load("res://bin/player.gdns").new()
	print(test.player_name())

# Called when the node enters the scene tree for the first time.
func _on_Sprite_position_changed(node, new_pos):
	print("The position of " + node.name + " is now " + str(new_pos))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
