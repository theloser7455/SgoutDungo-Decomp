var spd2 = distance_to_point(obj_player.x, obj_player.y) / 10;
var dir2 = point_direction(x, y, obj_player.x, obj_player.y);
hspeed = (lengthdir_x(spd2, dir2) + random_range(40, -40)) / 5;
vspeed = (lengthdir_y(spd2, dir2) + random_range(40, -40)) / 5;
alarm[0] = 200;
alarm[1] = 2;
