if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (!melt && instance_exists(obj_pizzacutter1))
    {
        with (instance_place(x, y, obj_pizzacutter1))
            spinspeed = 15;
    }
    
    ds_list_add(global.saveroom, id);
}
