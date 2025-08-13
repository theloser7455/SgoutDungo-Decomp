with (instance_create(xstart, ystart, obj_explosioneffect))
    sprite_index = spr_bombexplosion;

for (var i = 0; i < 3; i += 1)
{
    with (instance_create(x, y, obj_baddiegibs))
    {
        sprite_index = spr_snickfuckingdying;
        image_index = i;
        vsp = random_range(-10, -15);
        hsp = random_range(5, -5);
    }
}

scr_soundeffect(sfx_explosion);
instance_destroy();
