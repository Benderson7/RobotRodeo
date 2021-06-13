/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y+vspd,obj_wall) || y+vspd > maxy || y+vspd < miny) {
	vspd *= -1;	
}

if (vspd < 0 && place_meeting(x, y+vspd, obj_player)){
	carry = instance_place(x, y+vspd, obj_player);
	carry.vspd = 0;
	carry.y += vspd;
} else  if (vspd < 0 && place_meeting(x, y+vspd, obj_enem_player1)){
	carry = instance_place(x, y+vspd, obj_enem_player1);
	carry.vspd = 0;
	carry.y += vspd;
}
y += vspd;