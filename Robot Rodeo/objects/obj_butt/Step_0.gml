/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,obj_can_push)) {
	image_index = 0;
	audio_play_sound(snd_butt, 10, false);
	if (freq == 1) {
		global.freq1 = true;	
	} else {
		global.freq2 = true;	
	}
}