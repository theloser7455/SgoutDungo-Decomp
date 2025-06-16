repeat (20)
{
    with (instance_create(x, y, obj_baddiegibs))
    {
        sprite_index = spr_iceblockshards;
        hsp = random_range(25, -25);
        vsp = random_range(25, -25);
    }
}
