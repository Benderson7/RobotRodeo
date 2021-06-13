/// @description Insert description here
// You can write your code in this editor
if (!createddummies) {
	for(var i = 0; i < array_length(dummylist); i++) {
		if(dummylist[i] == "S") {
			newboy = instance_create_depth(x, y-64, depth, obj_player_dummy);	
			newboy.target = self;
			newboy.height = array_length(dummylist) - i;
		} else if(dummylist[i] == "F") {
			newboy = instance_create_depth(x, y-64, depth, obj_enem_dummy);	
			newboy.target = self;
			newboy.height = array_length(dummylist) - i;
		} else if(dummylist[i] == "J") {
			newboy = instance_create_depth(x, y-64, depth, obj_enem_dummy_jump);	
			newboy.target = self;
			newboy.height = array_length(dummylist) - i;
		} else if(dummylist[i] == "A") {
			newboy = instance_create_depth(x, y-64, depth, obj_enem_dummy_armor);	
			newboy.target = self;
			newboy.height = array_length(dummylist) - i;
		} 
	}
	createddummies = true;
}


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

if (place_meeting(x + hspd, y + vspd, obj_spike)) {
	son = instance_place(x, y-2, obj_dummy)
		son.becomeboy = true;
		newdummies = [];
		for (var i = 0; i < array_length(dummylist) - 1; i++) {
			newdummies[i] = dummylist[i];	
		}
		son.potentialdummylist = newdummies;

		instance_destroy();
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

if (place_meeting(x, y+vspd, obj_enemy)) {
	if (vspd > 0) {
		with(obj_dummy){
			instance_destroy();	
		}
		enem = instance_place(x, y+vspd, obj_enemy);
		if (enem.charid == "F") {
			newboy = instance_create_depth(enem.x,enem.y,depth,obj_enem_player1);
		} else if (enem.charid == "J") {
			newboy = instance_create_depth(enem.x,enem.y,depth,obj_enem_player_jump);
		} else if (enem.charid == "A") {
			newboy = instance_create_depth(enem.x,enem.y,depth,obj_enem_player_armor);
		}
		newboy.dummylist = dummylist;
		newboy.dummylist[array_length(dummylist)] = charid;
		instance_destroy(enem);
		instance_destroy();
	} else {
		son = instance_place(x, y-2, obj_dummy)
		son.becomeboy = true;
		newdummies = [];
		for (var i = 0; i < array_length(dummylist) - 1; i++) {
			newdummies[i] = dummylist[i];	
		}
		son.potentialdummylist = newdummies;

		instance_destroy();
	}
}

if (topcollideright && hspd > 0) {
	
	hspd = 0;
}

if (topcollideleft && hspd < 0) {
	
	hspd = 0;	
}

if (topcollidetop && vspd < 0) {
	vspd = 0;	
}

y += vspd;
x += hspd;

topcollideright = false;
topcollideleft = false;
topcollidetop = false;