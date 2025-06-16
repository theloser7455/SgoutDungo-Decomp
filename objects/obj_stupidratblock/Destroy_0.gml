if (ds_list_find_index(global.saveroom, id) == -1)
{
    scr_soundeffect(sfx_killenemy);
    scr_soundeffect(sfx_ratdeath);
    scr_sleep(50);
    
    repeat (3)
        instance_create(x, y, obj_slapstar);
    
    repeat (3)
        instance_create(x, y, obj_baddiegibs);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.deadspr;
    
    ds_list_add(global.saveroom, id);
    global.combo += 1;
    global.combotime = 100;
}
