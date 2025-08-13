image_speed = 0.35;

if (!chaseboss)
{
    if (!grounded)
        hsp = image_xscale * 8;
    
    if (fling)
        hsp = image_xscale * 12;
    
    if (vegetable)
        hsp = 0;
    
    if (grounded && vsp >= 0)
    {
        hsp = 0;
        fling = 0;
        sprite_index = spr_playerN_noisebombland;
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_noisebombland)
        {
            vsp = -5;
            sprite_index = spr_playerN_noisebomb;
        }
    }
    
    if (place_meeting(x, y, obj_baddie))
        instance_destroy();
    
    if (place_meeting(x + hsp, y, obj_destructibles))
        instance_destroy();
    
    if (place_meeting(x + hsp, y, obj_bombblock))
        instance_destroy();
    
    if (scr_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_bombblock))
    {
        image_xscale *= -1;
        fling = 0;
    }
    
    scr_collide();
}

if (instance_exists(obj_bestbossever) && vegetable)
    x = obj_bestbossever.x;

if (instance_exists(obj_strongbaddie) && chaseboss)
{
    x = Approach(x, obj_strongbaddie.x, 5);
    y = Approach(y, obj_strongbaddie.y, 5);
}
