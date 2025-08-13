if (next > 0)
{
    with (instance_create(x, y, obj_heavensgemprojectile))
    {
        vsp = -10;
        hsp = -3;
        next = other.next - 1;
        image_xscale = 1 + (0.25 * next);
        
        if (next <= 0)
            image_xscale = 0.75;
        
        image_yscale = image_xscale;
    }
    
    with (instance_create(x, y, obj_heavensgemprojectile))
    {
        vsp = -10;
        hsp = 3;
        next = other.next - 1;
        image_xscale = 1 + (0.25 * next);
        
        if (next <= 0)
            image_xscale = 0.75;
        
        image_yscale = image_xscale;
    }
}

repeat ((next * 2) + 1)
{
    with (instance_create(x, y, obj_baddiegibs))
    {
        sprite_index = spr_iceblockshards;
        hsp = random_range(25, -25);
        vsp = random_range(25, -25);
    }
}

scr_soundeffect(choose(sfx_breakblock1, sfx_breakblock2));
