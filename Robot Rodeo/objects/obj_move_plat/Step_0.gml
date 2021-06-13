/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y+vspd,obj_wall) || y+vspd > maxy || y+vspd < miny) {
	vspd *= -1;	
}

if (vspd < 0 && place_meeting(x, y+vspd, obj_can_be_moved)){
	carry = instance_place(x, y+vspd, obj_can_be_moved);
	carry.y += vspd;
}

y += vspd;