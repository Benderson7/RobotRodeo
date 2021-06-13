x += (xTo - x)/10;
y += (yTo - y)/10;


if (instance_exists(obj_player))
{
	follow = obj_player;
}
else if (instance_exists(obj_enem_player1))
{
	follow = obj_enem_player1;
}
else
{
	follow = self;
}

if (follow != noone and instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);