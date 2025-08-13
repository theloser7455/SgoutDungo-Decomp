if (state != states.enemygrabbed)
{
    scr_collide();
    visible = true;
}
else if (obj_player.character == "R")
{
    visible = false;
}

if (scaredbuffer > -1)
    scaredbuffer--;

xscaleplus = lerp(xscaleplus, 0, 0.125);

if (!grounded)
    yscaleplus = lerp(yscaleplus, 0, 0.125);
else
    yscaleplus = 0;

if (thrown)
{
    with (instance_place(x, y, obj_collect))
    {
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
    }
    
    with (instance_place(x, y, obj_bigcollect))
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "100";
        
        global.collect += 100;
        scr_soundeffect(sfx_collectpizza);
        instance_destroy();
        global.combotime = 100;
        
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
    
    with (instance_place(x, y, obj_giantcollect))
    {
        with (instance_create(x, y, obj_smallnumber))
            number = "1000";
        
        global.collect += 1000;
        scr_soundeffect(sfx_collectgiantpizza);
        instance_destroy();
        global.combotime = 100;
        
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
}
