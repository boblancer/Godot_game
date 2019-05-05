#ifndef Bullet_Header
#define Bullet_Header

#include <Area2D.hpp>
#include <Godot.hpp>
#include <Timer.hpp>
#include <Vector2.hpp>
#include <Ref.hpp>
namespace godot{

class Bullet: public Area2D{
GODOT_CLASS(Bullet, Area2D)

public:
	static void _register_methods();
	static Timer* lifetime_timer;
	Bullet();
    ~Bullet();


    void start(Vector2 _position, Vector2 _direction);

	void _ready();
	void _process(float delta);

	void _on_Lifetime_timeout();
	void _on_Bullet_body_entered();
	void explode();

private:
	int damage;
	float lifetimeVal;
	Vector2 velocity;
};

}

#endif 