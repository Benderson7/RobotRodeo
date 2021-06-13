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

if ( x+hspd > maxx || x+hspd < minx) {
	hspd *= -1;	
}

if (hspd > 0) {
	if(!facingright) {
		facingright = true;
	}
} else if (hspd < 0) {
	if(facingright) {
		facingright = false;	
	}
}

if(facingright){
	sprite_index = right_sprite;	
} else {
	sprite_index = left_sprite;	
}

y += vspd;
x += hspd;