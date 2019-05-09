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
	queue_free()

func _on_Bullet_body_entered(body):
	explode()
	if body.has_method('take_damage') and body.object_name == "fish":
		body.take_damage(damage)

func _on_Lifetime_timeout():
	explode()