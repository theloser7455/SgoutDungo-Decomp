if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    instance_create(x, y, obj_bangeffect);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    
    if (audio_is_playing(theme))
        audio_stop_sound(theme);
    
    var bnbnbnbnbbn = floor(random_range(1, 1000));
    
    if (bnbnbnbnbbn == 1 && global.collect >= global.crank && !global.deathmode)
        show_message("your gameplay is ass");
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
        minut = random_range(10, 0);
        secund = random_range(0, 70);
    }
    
    instance_destroy();
    
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_hungrypillar_dead;
    
    scr_soundeffect(sfx_killenemy);
    scr_soundeffect(sfx_escaperumble);
    instance_create(x, y + 600, obj_itspizzatime);
    
    with (instance_create(x, y, obj_bossdefeatflash))
    {
        fadeout = 0.1;
        var n = random_range(0, 100);
        
        if (floor(n) == 5)
            blamesomoneveryspecific = 1;
    }
    
    global.panic = 1;
    
    if (!global.deathmode)
    {
        obj_camera.alarm[1] = 60;
        
        switch (room)
        {
            case medieval_10:
                global.minutes = 1;
                global.seconds = 40;
                break;
            
            case ruin_11:
                global.minutes = 1;
                global.seconds = 30;
                break;
            
            case dungeon_10:
                global.minutes = 2;
                global.seconds = 0;
                break;
            
            case medieval_1:
                global.minutes = 0;
                global.seconds = 10;
                break;
        }
    }
    
    global.wave = 0;
    global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
    
    if (global.panicbg)
        scr_panicbg_init();
    
    ds_list_add(global.saveroom, id);
    global.combotime = 100;
}
