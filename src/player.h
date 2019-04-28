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
	void HandleWeaponRotation(InputEvent* e);
	String Update_motion();
	void Processs_rotation(InputEventMouse* e);

private:
	int bullet;
	int speed;
	int rotation_speed;
	float gun_cooldown;
	int hp;
	Vector2 velocity;
	bool can_shoot;
	bool alive;
	Node2D* gun;
};

}

#endif 