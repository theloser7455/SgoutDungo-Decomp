image_xscale = obj_player.xscale;
var forklin = 0;

with (obj_player)
{
    if (state == 9459 && movespeed >= 10)
        forklin = 1;
    
    if (state == 308 && sprite_index != spr_playerN_noisebombspinjump)
        forklin = 1;
}

if (obj_player.state != 89 && !forklin)
    instance_destroy();

x = obj_player.x;
y = obj_player.y;

if (obj_player.mask_index == spr_crouchmask)
    y = obj_player.y + 16;
