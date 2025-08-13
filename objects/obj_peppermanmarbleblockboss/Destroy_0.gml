repeat (12)
{
    with (instance_create(random_range(x - 32, x + 32), random_range(y - 64, y + 32), obj_baddiegibs))
        sprite_index = spr_marbledebris;
}

scr_soundeffect(choose(sfx_breakblock1, sfx_breakblock2));
