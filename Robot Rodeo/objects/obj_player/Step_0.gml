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

if (place_meeting(x + hspd, y + vspd, obj_spike) && iframe == 0) {
	with(obj_fade) {
		dead = true;	
	}
	instance_destroy();
}

if (place_meeting(x + hspd, y + vspd, obj_badge)) {
	with(obj_fade) {
		win = true;	
	}
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

if (place_meeting(x, y+vspd, obj_enemy) && iframe == 0) {
	if (vspd > 0) {
		enem = instance_place(x, y+vspd, obj_enemy);
		if (enem.charid == "F") {
			newboy = instance_create_depth(enem.x,enem.y,depth,obj_enem_player1);
		} else if (enem.charid == "J") {
			newboy = instance_create_depth(enem.x,enem.y,depth,obj_enem_player_jump);
		} else if (enem.charid == "A") {
			newboy = instance_create_depth(enem.x,enem.y,depth,obj_enem_player_armor);
		}
		with (newboy) {
			dummylist = ["S"];
		}
		instance_destroy(enem);
		instance_destroy();
	} else {
		with(obj_fade) {
			dead = true;	
		}
		instance_destroy();
	}
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
	sprite_index = spr_player_right;	
} else {
	sprite_index = spr_player_left;	
}


y += vspd;
x += hspd;

if(iframe <= 0) {
	iframe = 0;	
	image_alpha = 1;
} else {
	iframe -= 1;
	if (iframe % 7 == 0) {
		if (image_alpha == 0.5) {
			image_alpha = 1;
		}	else {
			image_alpha = 0.5;
		}
	}
}