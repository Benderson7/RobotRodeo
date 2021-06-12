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

if (keyboard_check_pressed(ord("W")) && onground) {
	vspd = -jump;	
}

if (place_meeting(x, y+vspd, obj_wall)) {
	while (!place_meeting(x, y + sign(vspd), obj_wall)) {
		y += sign(vspd);
	}
	
	vspd = 0;
	onground = true;
	coyote = 5;
} else {
	if (coyote <= 0) {
		onground = false;	
	} else {
		coyote -= 1;	
	}
}

if (place_meeting(x+hspd, y, obj_wall)) {
	while (!place_meeting(x + sign(hspd), y, obj_wall)) {
		x += sign(hspd);
	}
	
	hspd = 0;	
}

y += vspd;
x += hspd;