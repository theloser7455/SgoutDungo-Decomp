if (instance_exists(obj_endlevelfade))
{
    if (!obj_endlevelfade.showtimer)
        instance_destroy();
    else
        scr_soundeffect(sfx_snicksexescream);
}

alarm[0] = 100;
