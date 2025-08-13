with (instance_place(x, y, obj_player))
{
    if (key_up2 && grounded)
    {
        global.difficulty += 1;
        
        if (audio_is_playing(sfx_difficultydown))
            audio_stop_sound(sfx_difficultydown);
        
        if (audio_is_playing(sfx_difficultyup))
            audio_stop_sound(sfx_difficultyup);
        
        if (global.difficulty > 1)
        {
            global.difficulty = 0;
            scr_soundeffect(sfx_difficultydown);
        }
        else
        {
            scr_soundeffect(sfx_difficultyup);
        }
        
        scr_soundeffect(sfx_stompenemy);
    }
}

rottt = lerp(rottt, 45 + (-90 * global.difficulty), 0.25);
