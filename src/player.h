#ifndef PlAYER_H
#define PLAYER_H

#include <KinematicBody2D.hpp>
#include <Node2d.hpp>
#include <Godot.hpp>
#include <InputEvent.hpp>
#include <Input.hpp>
#include <InputEventAction.hpp>
#include <InputEventMouseButton.hpp>
#include <GlobalConstants.hpp>
#include <cmath>
#include <Node.hpp>
#include <Position2D.hpp>
#include <PackedScene.hpp>
#include <bullet.h>
#include <Timer.hpp>
#include <ResourceLoader.hpp>


namespace godot{

class Player: public KinematicBody2D{
	GODOT_CLASS(Player, KinematicBody2D)

public:
	static void _register_methods();

	Player();
    ~Player();

	void _init();
	String get_player_name();
	

	void _ready();
	void _control(float delta);
	void _process(float delta);
	void shoot();
	String Update_motion();

	void _on_Gun_Timer_timeout();

	Ref<PackedScene> Bullet;
	static Position2D* muzzle;
	static Timer* gun_cooldown;

private:

	float gun_cooldownVal;
	int ammo;
	int speed;
	int rotation_speed;;
	int hp;
	Vector2 velocity;
	bool can_shoot;
	bool alive;


};

}

#endif 