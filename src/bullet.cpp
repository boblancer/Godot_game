#include "bullet.h"
 
namespace godot{

Timer* Bullet::lifetime_timer ;

Bullet::Bullet(){


}
Bullet::~Bullet() {
    // add your cleanup here
}

void Bullet::_ready(){
	lifetime_timer = (Timer*)get_node("Lifetime");
	lifetime_timer->set_wait_time(lifetimeVal) ;
	velocity = Vector2();
}

void Bullet::start(Vector2 _position, Vector2 _direction){
	set_global_position(_position);
	set_global_rotation_degrees(_direction.angle());
	
}
void Bullet::_register_methods(){
	register_property<Bullet, float>("lifetime", &Bullet::lifetimeVal, 5.0);
	register_method("_ready", &Bullet::_ready);
	register_method("_process", &Bullet::_process);
	register_signal<Bullet>((char *)"position_changed", "node", GODOT_VARIANT_TYPE_OBJECT, "new_pos", GODOT_VARIANT_TYPE_VECTOR2);
	register_signal<Bullet>((char *)"debug_message", "node", GODOT_VARIANT_TYPE_OBJECT, "debug", GODOT_VARIANT_TYPE_INT);
	//register_method((char*) "_input", &Player::Processs_rotation);
}

void Bullet::_process(float delta){
	set_global_position(get_global_position() + velocity * 4);
}

void Bullet::_on_Lifetime_timeout(){
	return;
}

void Bullet::_on_Bullet_body_entered(){
	return;
}

void Bullet::explode(){
	return ;
}
}