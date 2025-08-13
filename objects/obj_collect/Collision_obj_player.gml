if (!fuckass)
{
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(sfx_collecttopping);
    global.collect += 10;
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = "10";
    
    instance_destroy();
    
    if ((global.combotime + 10) > 100)
        global.combotime = 100;
    else
        global.combotime += 10;
    
    if (instance_exists(obj_tv))
    {
        with (obj_tv)
        {
            shakething += 5;
            
            if (shakething >= 20)
                shakething = 20;
        }
    }
}
