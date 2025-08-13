if (ds_list_find_index(global.baddieroom, id) == -1)
{
    ds_list_add(global.baddieroom, id);
    
    if (corpse)
    {
        if (obj_player.paletteselect == 14 && obj_player.character == "P")
        {
            obj_player.image_blend = c_red;
            obj_player.spr_palette = spr_peppaletteRED;
        }
        
        var i = random_range(0, 100);
        
        if (i >= 95)
            scr_soundeffect(sfx_scream1, sfx_scream2, sfx_scream3, sfx_scream4, sfx_scream5, sfx_scream6, sfx_scream7, sfx_scream8, sfx_scream9, sfx_scream10);
        
        scr_soundeffect(sfx_killenemy);
        instance_create(x, y, obj_bangeffect);
        
        with (instance_create(x, y, obj_bangeffect))
            sprite_index = spr_genericpoofeffect;
        
        repeat (3)
            instance_create(x, y, obj_slapstar);
        
        repeat (3)
            instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        if (object_index != obj_rubin)
        {
            with (instance_create(x, y, obj_sausageman_dead))
            {
                sprite_index = other.spr_dead;
                image_blend = other.image_blend;
                spr_palette = other.spr_palette;
                paletteselect = other.paletteselect;
            }
        }
        
        if (global.holiday == "JOLLY")
        {
            with (instance_create(x, y, obj_sausageman_dead))
            {
                sprite_index = spr_jollyhat;
                image_xscale = 0.5;
                image_yscale = image_xscale;
            }
        }
        
        if (global.holiday == "SCARY")
        {
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_scaryhat;
        }
        
        obj_tv.image_index = random_range(0, 4);
        
        if (important != 1)
        {
            if (global.snickchallenge == 0)
            {
                global.combo += 1;
                global.collect += 10;
                
                with (instance_create(x, y, obj_smallnumber))
                    number = "10";
            }
            
            if ((global.combo == 10 && obj_player.character == "N" && obj_player.paletteselect == 6) && !global.lamepalettes)
                scr_soundeffect(sfx_bluu2);
            
            if (instance_exists(obj_tv))
            {
                with (obj_tv)
                {
                    shakething += 5;
                    
                    if (shakething >= 20)
                        shakething = 20;
                }
            }
        }
        
        global.combotime = 100;
        
        if (instance_exists(obj_player))
            obj_player.killstillsuper += 1;
        
        if (object_index == obj_rubin)
        {
            with (instance_create(x, y, obj_rubin_debris))
            {
                vspeed = -10;
                hspeed = 6;
                image_blend = other.image_blend;
            }
            
            with (instance_create(x, y, obj_rubin_debris))
            {
                vspeed = -10;
                hspeed = -6;
                image_blend = other.image_blend;
            }
            
            with (instance_create(x, y, obj_rubin_debris))
            {
                vspeed = -7;
                hspeed = 8;
                image_blend = other.image_blend;
            }
            
            with (instance_create(x, y, obj_rubin_debris))
            {
                vspeed = -7;
                hspeed = -8;
                image_blend = other.image_blend;
            }
            
            with (instance_create(x, y, obj_rubin_debris))
            {
                vspeed = -7;
                image_blend = other.image_blend;
            }
        }
    }
    
    scr_sleep(50);
}
