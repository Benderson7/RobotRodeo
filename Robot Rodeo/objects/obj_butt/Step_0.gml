/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,obj_can_push)) {
	image_index = 0;
	
	if (freq == 1) {
		if (global.freq1 == false) {
			global.freq1 = true;
			audio_play_sound(snd_butt, 10, false);
		}
	} else {
		if (global.freq2 == false) {
			global.freq2 = true;
			audio_play_sound(snd_butt, 10, false);
		}
	}
}