repeat (8)
{
    with (instance_create(480 + random_range(-100, 100), up + random_range(-100, obj_peppermancharge), object429))
        sprite_index = spr_bombexplosion;
}

with (instance_create(480, up, object429))
{
    gainvsp = 1;
    vsp = -8;
    image_speed = 0;
    sprite_index = spr_itspizzatime;
}

scr_soundeffect(sfx_explosion);
instance_destroy();
