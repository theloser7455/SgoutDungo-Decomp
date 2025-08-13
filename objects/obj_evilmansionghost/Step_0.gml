hsp = wave(-288, 288, 5 - thing, 0);
vsp = wave(254, 104, 5, 0);
var a = "x = Approach(x, (obj_player1.x + hsp), 8)\ny = Approach(y, (obj_player1.y - vsp), 8)";
var aa = "x = obj_player1.x + hsp\ny = obj_player1.y - vsp";
var aaa = "\nif (distance_to_point((obj_player1.x + hsp), (obj_player1.y - vsp)) > 1)\n{\n    x += lengthdir_x(8, point_direction(x, y, (obj_player1.x + hsp), (obj_player1.y - vsp)))\n    y += lengthdir_y(8, point_direction(x, y, (obj_player1.x + hsp), (obj_player1.y - vsp)))\n}";
speed = Approach(speed, 0, 0.25);
direction = point_direction(x, y, obj_player.x, obj_player.y);

if (speed == 0)
    speed = 12;

var die = 0;

with (instance_place(x, y, obj_baddie))
{
    if (thrown)
        die = 1;
}

if ((place_meeting(x, y, obj_player) && (obj_player.instakillmove || obj_player.state == states.handstandjump)) || (place_meeting(x, y, obj_baddie) && die))
{
    speed = -6;
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_genericpoofeffect;
    
    x += random_range(200, -200);
    y += random_range(200, -200);
}
