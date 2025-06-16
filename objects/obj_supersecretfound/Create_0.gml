if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    global.supersecretsfound += 1;
    
    with (obj_tv)
    {
        message = "YOU FOUND " + string(global.supersecretsfound) + " SUPER SECRETS OUT OF 3";
        
        if (global.supersecretsfound == 1)
            message = "YOU FOUND " + string(global.supersecretsfound) + " SUPER SECRET OUT OF 3";
        
        message = "YOU FOUND A SUPER SECRET";
        showtext = 1;
        alarm[0] = 150;
    }
    
    scr_soundeffect(sfx_supersecretfound);
    ds_list_add(global.saveroom, id);
}
