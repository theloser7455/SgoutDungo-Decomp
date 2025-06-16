if (!global.deathmode && !global.draintime)
{
    if (!audio_is_playing(mu_pizzatime) && global.panic == 1 && obj_pause.pause == 0 && obj_camera.ded == 0)
    {
        audio_stop_sound(pausedmusic);
        scr_sound(mu_pizzatime);
        pausedmusic = mu_pizzatime;
    }
    
    if (!audio_is_playing(mu_snickchallenge) && global.snickchallenge == 1 && obj_pause.pause == 0 && global.minutes >= 2 && obj_camera.ded == 0)
    {
        audio_stop_sound(pausedmusic);
        scr_sound(mu_snickchallenge);
        pausedmusic = mu_snickchallenge;
    }
    else if (!audio_is_playing(mu_snickchallengeend) && global.snickchallenge == 1 && obj_pause.pause == 0 && global.minutes < 2 && obj_camera.ded == 0)
    {
        audio_stop_sound(pausedmusic);
        scr_sound(mu_snickchallengeend);
        pausedmusic = mu_snickchallengeend;
    }
}
else if (!audio_is_playing(mu_chase) && obj_pause.pause == 0 && obj_camera.ded == 0 && global.draintime && global.deathmode)
{
    audio_stop_sound(pausedmusic);
    scr_sound(mu_chase);
    pausedmusic = mu_chase;
}

if (room != hub_room1)
    fadeoff = audio_sound_get_track_position(global.music);
else
    fadeoff = 0;

audio_sound_gain(pausedmusic, global.audiomusvol, 0.1);
