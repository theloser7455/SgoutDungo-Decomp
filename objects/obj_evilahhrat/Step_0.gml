if (image_speed < 0.5)
    image_speed += v;
else
    speed += 0.25;

v += 0.1;
direction = point_direction(x, y, obj_player.x, obj_player.y);

if (place_meeting(x, y, obj_player))
{
    instance_destroy();
    
    with (instance_create(x, y, obj_sausageman_dead))
    {
        sprite_index = spr_ratmountgroundpound_dead;
        vsp = -5;
        hsp = 0;
        scr_soundeffect(sfx_groundpound);
    }
}

image_angle = direction + 90;
