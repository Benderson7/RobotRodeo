/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (place_meeting(x,y,obj_badge)) {
	with(obj_fade) {
		win = true;
	}
}

if (keyboard_check(ord("R"))) {
	with(obj_fade) {
		dead = true;
	}
	instance_destroy();
}

if (place_meeting(x + target.hspd, y + target.vspd, obj_spike)) {
	with(obj_fade) {
		dead = true;
	}
	instance_destroy();
}