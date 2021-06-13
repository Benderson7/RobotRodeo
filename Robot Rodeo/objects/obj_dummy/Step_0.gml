/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x + target.spd, y, obj_wall)) {
	target.topcollideright = true;	
}

if (place_meeting(x - target.spd, y, obj_wall)) {
	target.topcollideleft = true;	
}

if (place_meeting(x, y - target.vspd * sign(target.vspd), obj_wall)) {
	target.topcollidetop = true;	
}

if (target.facingright) {
	sprite_index = right_sprite;	
} else {
	sprite_index = left_sprite;
}

if (becomeboy) {
	iframetime = 90;
	if (charid != "S") {
		if (charid == "F") {
			newboy = instance_create_depth(x,y,depth, obj_enem_player1);	
			newboy.dummylist = potentialdummylist;
			newboy.iframe = iframetime;
		} else if (charid == "J") {
			newboy	= instance_create_depth(x,y,depth, obj_enem_player_jump);	
			newboy.dummylist = potentialdummylist;
			newboy.iframe = iframetime;
		} else if (charid == "A") {
			newboy	= instance_create_depth(x,y,depth, obj_enem_player_armor);	
			newboy.dummylist = potentialdummylist;
			newboy.iframe = iframetime;
			
		}
		
		with(obj_dummy) {
			instance_destroy();	
		}
	} else {
		newboy = instance_create_depth(x,y,depth,obj_player);
		newboy.iframe = iframetime;
		instance_destroy();
	}
}