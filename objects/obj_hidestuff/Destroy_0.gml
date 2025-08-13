if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    instance_activate_object(obj_collect);
    ds_list_add(global.saveroom, id);
    scr_soundeffect(sfx_poof);
    
    with (obj_collect)
    {
        repeat (5)
        {
            with (instance_create(x, y, obj_machalleffect))
            {
                speed = random_range(3, 5);
                direction = random_range(0, 360);
            }
        }
    }
}
