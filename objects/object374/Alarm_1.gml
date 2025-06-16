with (obj_stoppedbaddie)
{
    instance_activate_object(baddieid);
    instance_activate_object(baddieid.baddieID);
    instance_deactivate_object(obj_forkhitbox);
    instance_destroy();
}

instance_create(x, y, obj_bossdefeatflash);
instance_destroy();
