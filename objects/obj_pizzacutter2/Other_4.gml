if (ds_list_find_index(global.saveroom, id) != -1)
{
    if (instance_exists(obj_pizzacutter1))
    {
        with (instance_place(x, y, obj_pizzacutter1))
        {
            spinspeed = 0;
            image_angle = random_range(360, 0);
        }
    }
    
    instance_destroy();
}
