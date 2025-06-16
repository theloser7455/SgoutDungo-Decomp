if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy();

if (!global.deathmode)
    instance_destroy();
