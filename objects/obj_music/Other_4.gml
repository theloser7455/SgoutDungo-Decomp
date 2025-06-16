if (global.panic == 0 && global.snickchallenge == 0 && !global.deathmode)
{
    if (instance_exists(obj_pepperman))
    {
        audio_stop_sound(pausedmusic);
        scr_sound(mu_chase);
    }
    
    if (room == rm_contentunlocked)
        audio_stop_sound(pausedmusic);
    
    var roomname = room_get_name(room);
    
    if (string_letters(roomname) == "Realtitlescreen" || string_letters(roomname) == "Realtitlescreen")
    {
        if (!audio_is_playing(mu_title))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_title);
            pausedmusic = mu_title;
        }
    }
    
    if (string_letters(roomname) == "hubroom")
    {
        if (!audio_is_playing(mu_hubsnick))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_hubsnick);
            pausedmusic = mu_hubsnick;
        }
    }
    
    if (string_letters(roomname) == "Titlescreen")
    {
        if (!audio_is_playing(mu_windloop))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_windloop);
            pausedmusic = mu_windloop;
        }
    }
    
    if (string_letters(roomname) == "PProom" || string_letters(roomname) == "PProom")
    {
        if (!audio_is_playing(mu_tutorial))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_tutorial);
            pausedmusic = mu_tutorial;
        }
    }
    
    if (string_letters(roomname) == "dungeon" || room == dungeon_5b)
    {
        for (i = 0; i < 20; i++)
        {
            if ((roomname == ("dungeon_" + string(i)) && i <= 8) || room == dungeon_5b)
            {
                if (!audio_is_playing(mu_dungeon))
                {
                    audio_stop_sound(pausedmusic);
                    scr_sound(mu_dungeon);
                    audio_sound_set_track_position(global.music, fadeoff);
                    pausedmusic = mu_dungeon;
                }
            }
            else if (roomname == ("dungeon_" + string(i)) && i > 8)
            {
                if (!audio_is_playing(mu_dungeondepth))
                {
                    audio_stop_sound(pausedmusic);
                    scr_sound(mu_dungeondepth);
                    audio_sound_set_track_position(global.music, fadeoff);
                    pausedmusic = mu_dungeondepth;
                }
            }
        }
    }
    
    if (string_letters(roomname) == "medieval")
    {
        for (i = 0; i < 20; i++)
        {
            if (roomname == ("medieval_" + string(i)) && i <= 2)
            {
                if (!audio_is_playing(mu_medievalentrance))
                {
                    audio_stop_sound(pausedmusic);
                    scr_sound(mu_medievalentrance);
                    audio_sound_set_track_position(global.music, fadeoff);
                    pausedmusic = mu_medievalentrance;
                }
            }
            else if (roomname == ("medieval_" + string(i)) && i > 2 && i <= 5)
            {
                if (!audio_is_playing(mu_medievalremix))
                {
                    audio_stop_sound(pausedmusic);
                    scr_sound(mu_medievalremix);
                    audio_sound_set_track_position(global.music, fadeoff);
                    pausedmusic = mu_medievalremix;
                }
            }
            else if (roomname == ("medieval_" + string(i)) && i > 5)
            {
                if (!audio_is_playing(mu_medieval))
                {
                    audio_stop_sound(pausedmusic);
                    scr_sound(mu_medieval);
                    audio_sound_set_track_position(global.music, fadeoff);
                    pausedmusic = mu_medieval;
                }
            }
        }
    }
    
    if (string_letters(roomname) == "ruin")
    {
        if (!audio_is_playing(mu_ruin))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_ruin);
            audio_sound_set_track_position(global.music, fadeoff);
            pausedmusic = mu_ruin;
        }
    }
    
    if (string_letters(roomname) == "medievalsecret" || string_letters(roomname) == "ruinsecret" || string_letters(roomname) == "dungeonsecret")
    {
        if (!audio_is_playing(mu_secret))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_secret);
            audio_sound_set_track_position(global.music, fadeoff);
            pausedmusic = mu_secret;
        }
    }
    
    if (string_letters(roomname) == "medievalsupersecret")
    {
        if (!audio_is_playing(mu_medievalsupersecret))
        {
            audio_stop_sound(pausedmusic);
            scr_sound(mu_medievalsupersecret);
            audio_sound_set_track_position(global.music, fadeoff);
            pausedmusic = mu_medievalsupersecret;
        }
    }
}
