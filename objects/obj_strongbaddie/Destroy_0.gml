instance_create(x, y, obj_bangeffect);

with (instance_create(x, y, obj_bangeffect))
    sprite_index = spr_genericpoofeffect;

with (instance_create(x, y, obj_sausageman_dead))
    sprite_index = other.spr_die;

scr_soundeffect(sfx_killenemy);

repeat (2)
{
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
}

with (obj_camera)
{
    shake_mag = 3;
    shake_mag_acc = 3 / room_speed;
}

if (global.holiday == "JOLLY")
{
    with (instance_create(x, y, obj_sausageman_dead))
    {
        sprite_index = spr_jollyhat;
        image_xscale = 0.5;
        image_yscale = image_xscale;
    }
}

if (global.holiday == "SCARY")
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_scaryhat;
}
