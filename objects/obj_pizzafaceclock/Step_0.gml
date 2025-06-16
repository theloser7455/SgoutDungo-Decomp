if (place_meeting(x, y, obj_player))
{
    global.seconds += 20;
    
    if (global.seconds > 60)
    {
        global.seconds -= 60;
        global.minutes += 1;
    }
    
    with (instance_create(x, y, obj_afterimog))
    {
        sprite_index = other.sprite_index;
        image_index = other.image_index;
        vspeed = -15;
    }
    
    scr_soundeffect(sfx_secretfound);
    instance_destroy();
}
