if (floor(image_index) == (image_number - 1) && obj_player.state != 77)
{
    with (obj_player)
    {
        state = 77;
        sprite_index = spr_snick_victory;
        
        if (character != "S")
            sprite_index = spr_victory;
        
        image_index = 0;
    }
    
    global.deathmode = 0;
    alarm[0] = 200;
    
    if (instance_exists(obj_snickexe))
    {
        with (obj_snickexe)
        {
            with (instance_create(x, y, obj_debris))
                sprite_index = spr_snick_gyatter;
            
            instance_destroy();
        }
    }
}

if (floor(image_index) == (image_number - 1))
    image_speed = 0;
