x = obj_player.x - (obj_player.xscale * 16);
y = obj_player.y;
image_xscale = obj_player.xscale;

if (obj_player.movespeed <= 7)
    instance_destroy();

with (obj_player)
{
    if (state != states.mach2 && state != states.mach3)
        instance_destroy(other.id);
}
