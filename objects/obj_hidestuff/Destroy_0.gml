if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    instance_activate_object(obj_collect);
    ds_list_add(global.saveroom, id);
}
