if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.snickchallenge == 0)
    {
        global.secretfound += 1;
        
        with (obj_tv)
        {
            message = "YOU HAVE FOUND " + string(global.secretfound) + " SECRET OUT OF 6";
            showtext = 1;
            alarm[0] = 150;
        }
        
        scr_soundeffect(sfx_secretfound);
        global.uniquecollects += 1;
    }
    
    if (global.deathmode)
    {
        global.seconds += 5;
        
        if (global.seconds > 60)
        {
            global.seconds -= 60;
            global.minutes += 1;
        }
    }
    
    ds_list_add(global.saveroom, id);
}
