extends Area2D

export (int) var speed
export (int) var damage
export (float) var lifetime
const object_name = "Bullet"

var velocity = Vector2()

func _ready():
	$Anim.play("Bullet")
	
func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	$Lifetime.wait_time = lifetime
	velocity = _direction * speed

func _process(delta):
	position += velocity * delta

func explode():
	$Timer.start()
	$Anim.play("Explosion")
	$Anim.scale = Vector2(0.3,0.2)
	velocity = Vector2(0,0)

func _on_Lifetime_timeout():
	explode()

func _on_Explosive_body_entered(body):
	explode()
	if body.has_method('take_damage') :
		body.take_damage(damage)

	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
