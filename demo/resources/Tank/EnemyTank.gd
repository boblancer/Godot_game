extends KinematicBody2D

onready var root = get_parent()

signal shoot
signal health_changed
signal dead

export (PackedScene) var Bullet
export (int) var max_speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var hp

export (float) var turret_speed
export (int) var detect_radius
var speed = 0
var target = null

var object_name = "tank"
var max_hp = 400.0
var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	$GunTimer.wait_time = gun_cooldown
	var circle = CircleShape2D.new()
	$DetectRadius/CollisionShape2D.shape = circle
	$DetectRadius/CollisionShape2D.shape.radius = detect_radius
	$GUI/Nickname.text = "Tank"

func control(delta):
	if $LookAhead1.is_colliding() or $LookAhead2.is_colliding():
		speed = lerp(speed, 0, 0.1)
	else:
		speed = lerp(speed, max_speed, 0.05)
	if root is PathFollow2D:
		root.set_offset(root.get_offset() + speed * delta)
		position = Vector2()
	else:
		# other movement code
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()
		if target_dir.dot(current_dir) > 0.9:
			shoot()
	if hp <= 0:
		queue_free()

func _on_DetectRadius_body_entered(body):
	if body.object_name == "fish":
		target = body
		print("target acquire")

func _on_DetectRadius_body_exited(body):
	if body == target:
		target = null

func take_damage(damage):
	print("tank is taking damage")
	hp -= damage
	$GUI/HealthBar.set_value((hp/max_hp) * 100)
	
	
func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1, 0).rotated($Turret.global_rotation)
		emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir)
		
func _physics_process(delta):
	if hp <= 0: 
		get_tree().get_root().find_node("Map01", true, false).enemy_count -= 1
		queue_free()
	control(delta)
	move_and_slide(velocity)

func _on_GunTimer_timeout():
	can_shoot = true

func _on_Shoot_timeout():
	print("random shot")
	var dir = Vector2(1, 0).rotated($Turret.global_rotation)
	emit_signal('shoot', Bullet, $Turret/Muzzle.global_position, dir)
	var b = Bullet.instance()
	b.start($Turret/Muzzle.global_position, dir)
	get_parent().add_child(b)
	pass # Replace with function body.
