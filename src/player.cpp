#include "player.h"
 
using namespace godot;

Player::Player(){
	velocity = Vector2(0,0);
	speed = 200;

}
Player::~Player() {
    // add your cleanup here
}

void Player::_register_methods(){
	register_method("player_name", &Player::get_player_name);
	register_method("_ready", &Player::_ready);
	register_method("_control", &Player::_control);
	register_method("_process", &Player::_process);
	register_signal<Player>((char *)"Set_gun_cooldown", "node", GODOT_VARIANT_TYPE_OBJECT, "value", GODOT_VARIANT_TYPE_REAL);
	register_method((char*) "_input", &Player::HandleWeaponRotation);

	register_signal<Player>((char *)"position_changed", "node", GODOT_VARIANT_TYPE_OBJECT, "new_pos", GODOT_VARIANT_TYPE_VECTOR2);
	//register_method((char*) "_input", &Player::Processs_rotation);
}
void Player::HandleWeaponRotation(InputEvent* e){ 
	InputEventMouse* m = (InputEventMouse*) e;
	gun->look_at(m->get_global_position());
	return;
	
}
 String Player::Update_motion(){
	velocity = Vector2(0,0);
	Input* i = Input::get_singleton();
	if(i->is_action_pressed("ui_up")){
		velocity.y -= speed;
	}
	if(i->is_action_pressed("ui_down")){
		velocity.y += speed;
	}
	if(i->is_action_pressed("ui_left")){
		velocity.x -= speed;
	}
	if(i->is_action_pressed("ui_right")){
		velocity.x += speed;
	}
	
	return "";

}
void Player::Processs_rotation(InputEventMouse* e){
	//print("foo");
	set_position(e->get_global_position());
}
void Player::_init(){
	int bullet = 0;
	int speed = 0;
	int rotation_speed = 0;
	float gun_cooldown = 0;
	int hp  = 0;
	Vector2 velocity  = Vector2(0, 0);
	bool can_shoot = false;
	bool alive = false;

}

String Player::get_player_name(){
	String name = "Mckenzie";

	return name;
}

void Player::_ready(){
	//emit_signal("Set_gun_cooldown", this, gun_cooldown);
	gun = (Node2D*) get_child(0);

}
void Player::_control(float delta){
	/*
	this.look_at(get_global_mouse_position)
	int dir = 0;
	float rotation = 0;
	if(Input.is_action_pressed("turn_right"))
		dir += 1;
	if(Input.is_action_pressed("turn_left"))
		dir -= 1;
	rotation += rotation_speed * dir * delta;
	velocity = Vector2();

	if(Input.is_action_pressed("forward"))
		velocity = Vector2(speed, 0).rotated(rotation);
	if(Input.is_action_pressed("backward"))
		velocity = Vector2(-speed, 0).rotated(rotation);
	*/
	return;
}

void Player::_process(float delta){
	if(!alive )
		return;
	Update_motion();
	move_and_slide(velocity);
	//emit_signal("position_changed", this, get_position());
	//_control(delta);
	//HandleInputEvent();

}