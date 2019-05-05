extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = null
var walk_delay = 1
var can_walk = true
var facing 
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Walk_timer")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _on_Timer_timeout():
	play("idle")
