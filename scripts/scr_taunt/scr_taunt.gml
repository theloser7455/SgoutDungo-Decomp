function scr_taunt()
{
	if (key_taunt2)
	{
	    with (obj_baddie)
	    {
	        if (distance_to_object(other) <= 320)
	        {
	            if (state == 104)
	                stunned = 0;
	            
	            bombreset = 0;
	        }
	    }
	    
	    if (character != "R")
	    {
	        scr_soundeffect(sfx_taunt);
	        taunttimer = 20;
	        tauntstoredmovespeed = movespeed;
	        tauntstoredsprite = sprite_index;
	        tauntstoredstate = state;
	        tauntstoredvsp = vsp;
	        tauntstoredhsp = hsp;
	        state = 50;
	        image_index = random_range(0, sprite_get_number(spr_taunt) - 1);
	        sprite_index = spr_taunt;
	        instance_create(x, y, obj_taunteffect);
	        instance_create(x, y, obj_parryhitbox);
	    }
	    else
	    {
	        if (audio_is_playing(yodeling))
	            audio_stop_sound(yodeling);
	        
	        scr_soundeffect(yodeling);
	        audio_sound_pitch(yodeling, random_range(0.1, 2));
	        
	        if (global.combo >= 10 && supertaunts > 0 && key_up)
	        {
	            supertaunts -= 1;
	            
	            if (global.supertaunt == 2 || global.supertaunt == 1)
	            {
	                with (instance_create(x, y, obj_tauntafterimage))
	                    hspeed = 20;
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                    hspeed = -20;
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                    vspeed = 20;
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                    vspeed = -20;
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                {
	                    hspeed = 20;
	                    vspeed = 20;
	                }
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                {
	                    hspeed = 20;
	                    vspeed = -20;
	                }
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                {
	                    hspeed = -20;
	                    vspeed = 20;
	                }
	                
	                with (instance_create(x, y, obj_tauntafterimage))
	                {
	                    hspeed = -20;
	                    vspeed = -20;
	                }
	            }
	            
	            if (global.supertaunt == 3)
	            {
	                with (instance_create(x, y, obj_bangeffect))
	                {
	                    sprite_index = spr_bombexplosion;
	                    image_xscale = 2;
	                    image_yscale = image_xscale;
	                    image_speed = 0.5;
	                }
	                
	                with (instance_create(x, y, obj_bossdefeatflash))
	                    fadeout = 0.05;
	                
	                scr_soundeffect(sfx_bombpepexplode);
	            }
	            
	            with (obj_baddie)
	            {
	                if (point_in_rectangle(x, y, __view_get(0, 0), __view_get(1, 0), __view_get(0, 0) + __view_get(2, 0), __view_get(1, 0) + __view_get(3, 0)))
	                {
	                    if (global.supertaunt == 3)
	                    {
	                        with (instance_create(x, y, obj_bangeffect))
	                            sprite_index = spr_bombexplosion;
	                    }
	                    
	                    instance_destroy();
	                }
	            }
	            
	            with (obj_camera)
	            {
	                shake_mag = 20;
	                shake_mag_acc = 30 / room_speed;
	            }
	        }
	    }
	}
}
