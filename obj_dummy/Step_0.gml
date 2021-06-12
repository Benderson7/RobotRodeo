/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x + target.spd, y, obj_wall)) {
	target.topcollideright = true;	
}

if (place_meeting(x - target.spd, y, obj_wall)) {
	target.topcollideleft = true;	
}

if (becomeboy) {
	if (charid != "S") {
		if (charid == "F") {
			newboy = instance_create_depth(x,y,depth, obj_enem_player1);	
			newboy.dummylist = potentialdummylist;
		} //add jumpy and armor pls uwu
		
		with(obj_dummy) {
			instance_destroy();	
		}
	} else {
		instance_create_depth(x,y,depth,obj_player);
		instance_destroy();
	}
}