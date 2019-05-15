extends Area2D

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

func _on_Pickup_body_entered(body):
	#if body.object_name == "fish":
		
	pass # Replace with function body.
