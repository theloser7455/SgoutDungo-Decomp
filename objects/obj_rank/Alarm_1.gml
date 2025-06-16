if (instance_exists(obj_littlenoisegremlin))
{
    with (obj_littlenoisegremlin)
    {
        with (instance_create(x, y, obj_explosioneffect))
            sprite_index = spr_bombexplosion;
        
        instance_destroy();
    }
    
    scr_soundeffect(sfx_bombpepexplode);
}
