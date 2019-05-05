#include "player.h"

using namespace godot;

Position2D* Player::muzzle ;
Timer* Player::Gun_Timer ;
Player::Player(){
	velocity = Vector2(0,0);
	speed = 200;
	ammo = 30;
	bool can_shoot = true;
	gun_cooldownVal = 0.2;

}
Player::~Player() {
    // add your cleanup here
}

void Player::_register_methods(){
	//register_property<Bullet, Ref<PackedScene>> ((char*) "bullet", &Player::Bul
	//Bullet = ResourceLoader::get_singleton()->load("res://Bullet.tscn");let
	//	, ResourceLoader::get_singleton()->load("res://Bullet.tscn"));
	//register_property<Player, Ref<PackedScene>> ((char *) "Player_bullet", &Player::Bullet, ResourceLoader::get_singleton()->load("res://Bullet.tscn") );
	register_property<Player, int>("ammo", &Player::ammo, 30);

	register_method("player_name", &Player::get_player_name);
	register_method("_ready", &Player::_ready);
	register_method("_control", &Player::_control);
	register_method("_process", &Player::_process);

	register_signal<Player>((char *)"Set_gun_cooldown", "node", GODOT_VARIANT_TYPE_OBJECT, "value", GODOT_VARIANT_TYPE_REAL);
	register_signal<Player>((char *)"is_walking", "node", GODOT_VARIANT_TYPE_OBJECT, "direction", GODOT_VARIANT_TYPE_INT);
	register_signal<Player>((char *)"shoot",  "position", GODOT_VARIANT_TYPE_VECTOR2 , "direction", GODOT_VARIANT_TYPE_REAL);
	register_signal<Player>((char *)"position_changed", "node", GODOT_VARIANT_TYPE_OBJECT, "new_pos", GODOT_VARIANT_TYPE_VECTOR2);
	register_signal<Player>((char *)"debug_message", "node", GODOT_VARIANT_TYPE_OBJECT, "debug", GODOT_VARIANT_TYPE_INT);

	register_method("_on_Gun_Timer_timeout", &Player::_on_Gun_Timer_timeout);


	//register_method((char*) "_input", &Player::Processs_rotation);
}

 String Player::Update_motion(){
	velocity = Vector2(0,0);
	Input* i = Input::get_singleton();
	if(i->is_action_pressed("ui_up")){
		velocity.y -= speed;
		emit_signal("is_walking", this, 0);
	}
	if(i->is_action_pressed("ui_down")){
		velocity.y += speed;
		emit_signal("is_walking", this, 0);
	}
	if(i->is_action_pressed("ui_left")){
		velocity.x -= speed;
		emit_signal("is_walking", this, 2);
	}
	if(i->is_action_pressed("ui_right")){
		velocity.x += speed;
		emit_signal("is_walking", this, 1);
	}
	if(i->is_mouse_button_pressed(GlobalConstants::BUTTON_LEFT)){
		//emit_signal("debug_message", this, 555);
		shoot();
	}
	if(i->is_action_pressed("KEY_R")){
		ammo = 30;
		emit_signal("debug_message",  this, 300);
		//emit_signal("is_walking", this, 1);
	}

	
	return "";

}

void Player::_init(){

}

String Player::get_player_name(){
	String name = "Mckenzie";

	return name;
}

void Player::_ready(){
	//emit_signal("Set_gun_cooldown", this, gun_cooldown);
	//const godot::String gsNode2D = "Node2D";

	muzzle = (Position2D*)get_node("Controller/Gun/Muzzle");
	Gun_Timer = (Timer*)get_node("Controller/Gun/Gun_Timer");
	emit_signal("position_changed", this, muzzle->get_global_position());
	
	//gun = (Node2D*) get_child((int64_t) 1);

}
void Player::_control(float delta){

	return;
}
void Player::_on_Gun_Timer_timeout(){
	can_shoot = true;
	emit_signal("debug_message", this, 420);
}

void Player::shoot(){

	if(can_shoot){
	ammo -= 1;
	emit_signal("shoot",  muzzle->get_global_position() , muzzle->get_global_rotation());
	can_shoot = false;
	Gun_Timer->start();
	}
}
void Player::_process(float delta){
	if(!alive )
		return;
	Update_motion();
	move_and_slide(velocity);
	//emit_signal("position_changed", this, muzzle->get_global_position());


}