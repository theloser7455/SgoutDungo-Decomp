if (!global.deathmode && !global.draintime)
{
    if (global.panic == 1 && obj_pause.pause == 0 && obj_camera.ded == 0)
    {
        if (obj_player1.character != "N")
        {
            if (!audio_is_playing(mu_escapePeppino))
            {
                audio_stop_sound(pausedmusic);
                scr_sound(mu_escapePeppino);
                pausedmusic = mu_escapePeppino;
            }
        }
        
        if (obj_player1.character == "N")
        {
            if (!audio_is_playing(mu_escapeNoise))
            {
                audio_stop_sound(pausedmusic);
                scr_sound(mu_escapeNoise);
                pausedmusic = mu_escapeNoise;
            }
        }
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
else if ((obj_pause.pause == 0 && ((obj_camera.ded == 0 && global.draintime) || global.instantR) && global.deathmode) && room != hub_room1 && room != cowboytask && room != hub_roomextra)
{
    if (!audio_is_playing(mu_hardmodethemeNEW))
    {
        audio_stop_sound(pausedmusic);
        scr_sound(mu_hardmodethemeNEW);
        pausedmusic = mu_hardmodethemeNEW;
    }
}

if ((instance_exists(obj_gameoverrestart) && !audio_is_playing(mu_timesup) && !audio_is_playing(sfx_pizzafacelaugh)) && !global.instantR)
{
    if (!audio_is_playing(mu_gameoverloop))
    {
        audio_stop_sound(pausedmusic);
        scr_sound(mu_gameoverloop);
        pausedmusic = mu_gameoverloop;
    }
}

if (room != hub_room1)
    fadeoff = audio_sound_get_track_position(global.music);
else
    fadeoff = 0;

if (!shutup)
    loudness = global.audiomusvol - goawayfromme;
else
    loudness = Approach(loudness, 0, 0.01);

if (!global.panic && !global.deathmode && !global.snickchallenge)
{
    with (obj_hungrypillar)
    {
        if (distance_to_object(obj_player) >= 501)
        {
            if (!audio_is_playing(theme))
            {
                scr_sound(theme);
                audio_sound_gain(theme, 0, 0.1);
            }
            
            audio_sound_gain(theme, 0, 180);
            other.goawayfromme = 0;
        }
        
        if (distance_to_object(obj_player) >= 500)
        {
            var thingy = (-distance_to_object(obj_player) + 600) / 200;
            
            if (thingy < 0)
                thingy = 0;
            
            if (thingy > 1)
                thingy = 1;
            
            audio_sound_gain(theme, thingy * global.audiomusvol, 180);
            
            if (audio_is_playing(theme))
                other.goawayfromme = thingy;
        }
        else
        {
            audio_sound_gain(theme, global.audiomusvol, 180);
            other.goawayfromme = 1;
        }
    }
}

if (!instance_exists(obj_hungrypillar))
    goawayfromme = 0;

audio_sound_gain(pausedmusic, loudness, 0.1);
audio_sound_gain(mu_hardmodethemeNEW, loudness * 2, 0.1);
