with (instance_place(x, y, obj_player))
{
    if (key_up2 && grounded)
    {
        global.difficulty += 1;
        
        if (global.difficulty > 2)
            global.difficulty = 0;
        
        with (instance_create(x, y, obj_debris))
        {
            sprite_index = spr_font;
            image_index = 28 + global.difficulty;
        }
        
        scr_soundeffect(sfx_stompenemy);
    }
}
