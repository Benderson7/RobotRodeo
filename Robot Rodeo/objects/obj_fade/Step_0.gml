/// @description Insert description here
// You can write your code in this editor

if (dead) {
	with(obj_enemy) {
		instance_create_depth(x,y,depth, obj_explode);
		instance_deactivate_object(self);
	}
	
	with(obj_enem_player1) {
		instance_create_depth(x,y,depth, obj_explode);
		instance_deactivate_object(self);
	}
	
	with(obj_dummy) {
		instance_create_depth(x,y,depth, obj_explode);
		instance_deactivate_object(self);
		
	}
} else if (win) {
	with(obj_enemy) {
		//instance_create_depth(x,y,depth, obj_explode);
		instance_deactivate_object(self);
	}
	
	with(obj_enem_player1) {
		//instance_create_depth(x,y,depth, obj_explode);
		instance_deactivate_object(self);
	}
	
	with(obj_dummy) {
		//instance_create_depth(x,y,depth, obj_explode);
		instance_deactivate_object(self);
		
	}
	if (!already_played) {
		audio_play_sound(snd_level_comp, 10, false);
		already_played = true;
	}
}

if (!dead && !win) {
	if (image_alpha >= 0) {
		image_alpha -= 0.03;	
	} else {
		image_alpha = 0;	
	}
} else if (wait > 0 && dead) {
	wait -= 1;
} else if (image_alpha < 1) {
	image_alpha += 0.03;	
} else {
	if (dead) {
		room_restart();	
	} else if (win) {
		room_goto_next();	
	}
}