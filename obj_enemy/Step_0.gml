/// @description Insert description here
// You can write your code in this editor

vspd += grav;
if (vspd >= termvel) {
	vspd = termvel;	
}


if (place_meeting(x, y+vspd, obj_wall)) {
	while (!place_meeting(x, y + sign(vspd), obj_wall)) {
		y += sign(vspd);
	}
	
	vspd = 0;
}

if (place_meeting(x+hspd, y, obj_wall)) {
	while (!place_meeting(x + sign(hspd), y, obj_wall)) {
		x += sign(hspd);
	}
	
	hspd *= -1;	
}

y += vspd;
x += hspd;