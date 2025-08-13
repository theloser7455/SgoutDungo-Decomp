if (!window_has_focus())
{
    if (instance_exists(obj_music))
    {
        if (audio_is_playing(obj_music.pausedmusic))
            audio_pause_sound(obj_music.pausedmusic);
    }
    
    if (audio_is_playing(mu_pausemenu))
        audio_pause_sound(mu_pausemenu);
}
else
{
    if (instance_exists(obj_music))
    {
        if (audio_is_paused(obj_music.pausedmusic))
            audio_resume_sound(obj_music.pausedmusic);
    }
    
    if (audio_is_paused(mu_pausemenu))
        audio_resume_sound(mu_pausemenu);
}

if ((!pause && instance_exists(obj_idioticunlock)) || instance_exists(obj_fakeloaderforsgoutdungo))
{
    if (obj_player.key_start)
        scr_soundeffect(fartie);
}

if ((!pause && !instance_exists(obj_fadeout)) && !instance_exists(obj_fakeloaderforsgoutdungo) && !instance_exists(obj_idioticunlock))
{
    var e = 0;
    
    with (obj_player)
    {
        if (state == states.gameover)
            e = 1;
        
        if (state == states.victory && place_meeting(x, y, obj_startgate))
            e = 1;
    }
    
    if (obj_player.key_start && room != rank_room && room != Realtitlescreen && room != timesuproom && room != creDIHts && !e)
    {
        selected = 0;
        
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout);
    }
}

if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
    instance_destroy(obj_pausefadeout);

x1++;
y1++;

if (pause == 1 && !instance_exists(obj_option) && !instance_exists(obj_modmenuthing) && !instance_exists(obj_fakeloaderforsgoutdungo))
{
    scr_getinput();
    application_surface_draw_enable(true);
    
    if (key_down2 && selected < 4)
    {
        selected += 1;
        scr_soundeffect(sfx_step);
    }
    
    if (key_up2 && selected > 0)
    {
        selected -= 1;
        scr_soundeffect(sfx_step);
    }
    
    if (key_jump && selected == 1)
        scr_levelrestartscript();
    
    if (key_jump2 && selected == 2)
    {
        with (instance_create(x, y, obj_option))
            depth = other.depth - 1;
    }
    
    if (key_jump2 && selected == 3)
    {
        with (instance_create(x, y, obj_modmenuthing))
            depth = other.depth - 1;
    }
    
    if (key_jump2 && selected == 4)
        scr_exitlevelscript();
    
    if (key_jump2 && selected == 0)
    {
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout);
    }
}

if (!instance_exists(obj_player))
    exit;

x = obj_player.x;
y = obj_player.y;

if (!file_exists("BLAMEKIWUMA.zip"))
    alarm[0] = -1;

window_set_cursor(cr_none);
