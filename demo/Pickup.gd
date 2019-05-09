extends Area2D

# Called when the node enters the scene tree for the first time.

func _ready():
	var random = randi() % 4
	if(random == 1):
		$AnimatedSprite.play("Sniper")
	elif(random == 2):
		$AnimatedSprite.play("Revolver")
	elif(random == 3):
		$AnimatedSprite.play("Shotgun")
	else:
		$AnimatedSprite.play("Uzi")
		
	print("pickup randomize")
	pass # Replace with function bod
	pass # Replace with function body.

func init(pos):
	position = pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pickup_body_entered(body):
	#if body.object_name == "fish":
		
	pass # Replace with function body.
