/// @description Insert description here
// You can write your code in this editor
hspd = 0;

if (keyboard_check(ord("A"))) {
 hspd = -spd;
} 

if (keyboard_check(ord("D"))) {
	hspd = spd;
} 



vspd += grav;
if (vspd >= termvel) {
	vspd = termvel;	
}

if (place_meeting(x, y+vspd, obj_wall)) {
	vspd = 0;
	onground = true;
} else {
	onground = false;	
}

if (keyboard_check_pressed(ord("W")) && onground) {
	vspd = -jump;	
}

if (place_meeting(x+hspd, y, obj_wall)) {
	hspd = 0;	
}

y += vspd;
x += hspd;