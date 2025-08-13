evilvar = 0;

with (obj_strongbaddie)
{
    vsp = -5;
    state = states.portal;
    stunned = -1;
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_parryeffect;
    
    with (instance_create(x, y, obj_bangeffect))
        sprite_index = spr_kungfueffect;
    
    repeat (4)
        instance_create(other.x, other.y, obj_slapstar);
    
    repeat (4)
        instance_create(other.x, other.y, obj_baddiegibs);
    
    instance_create(x, y, obj_bangeffect);
    other.sprite_index = other.spr_finishingblow1;
    other.image_index = 3;
    other.state = states.finishingblow;
    other.movespeed = 3;
    other.vsp = -3;
    
    if (x != obj_player1.x)
        xscale = sign(x - obj_player1.x);
    
    if (scr_solid(x, y))
    {
        x = other.x;
        y = other.y;
        
        if (mask_index == spr_pepperman_mask)
            y = other.y - 16;
    }
}

obj_camera.zooming = 0;
obj_camera.zoomto = 1;
