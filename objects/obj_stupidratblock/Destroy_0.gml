if (ds_list_find_index(global.saveroom, id) == -1)
{
    scr_soundeffect(sfx_killenemy);
    scr_soundeffect(sfx_ratdeath);
    
    if (bomb)
    {
        repeat (4)
        {
            with (instance_create(x + random_range(32, -32), y + random_range(64, -64), obj_bangeffect))
                sprite_index = spr_bombexplosion;
        }
        
        scr_soundeffect(sfx_explosion);
    }
    
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
