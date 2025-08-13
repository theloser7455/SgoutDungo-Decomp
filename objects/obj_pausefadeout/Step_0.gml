if (fadealpha > 1 && fadein == 0)
{
    if (obj_pause.pause == 1)
    {
        obj_pause.pause = 0;
        instance_activate_all();
        audio_resume_all();
        
        if (instance_exists(obj_snickexe) && !global.coolsnick)
        {
            with (obj_snickexe)
                coilangle = 0;
        }
        
        with (obj_music)
            audio_sound_gain(pausedmusic, loudness, 0.1);
        
        if (audio_is_playing(mu_pausemenu))
            audio_stop_sound(mu_pausemenu);
    }
    else if (obj_pause.pause == 0)
    {
        audio_pause_all();
        obj_pause.pause = 1;
        instance_deactivate_all(true);
        instance_activate_object(obj_pause);
        scr_sound(mu_pausemenu);
        audio_sound_gain(mu_pausemenu, global.audiomusvol, 0.1);
    }
    
    fadein = 1;
}

if (fadein == 0)
    fadealpha += 0.25;
else if (fadein == 1)
    fadealpha -= 0.25;

if (fadein == 1 && fadealpha < 0)
    instance_destroy();
