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

#include <NetworkedMultiplayerENet.hpp>
#include <NetworkedMultiplayerPeer.hpp>
#include <MultiplayerAPI.hpp>

namespace godot{

class Player: public KinematicBody2D{
	GODOT_CLASS(Player, KinematicBody2D)

public:
	static void _register_methods();

	Player();
    ~Player();

	void _init();

	void _ready();
	void _control(float delta);
	void _process(float delta);
	void shoot();
	void handle_input();
	void take_damage(int damage);
	void _on_Gun_Timer_timeout();

	Ref<PackedScene> Bullet;
	static Position2D* muzzle;
	static Timer* Gun_Timer;

private:

	float gun_cooldownVal;
	int ammo;
	int speed;
	int rotation_speed;;
	int max_hp;
	int hp;
	Vector2 velocity;
	bool can_shoot;
	bool alive;
	String object_name;


};

}

#endif 