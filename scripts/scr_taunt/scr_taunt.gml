function scr_taunt()
{
	if (key_taunt2)
	{
	    with (obj_baddie)
	    {
	        if (distance_to_object(other) <= 320)
	        {
	            if (state == states.enemystun)
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
	        state = states.backbreaker;
	        image_index = random_range(0, sprite_get_number(spr_taunt) - 1);
	        sprite_index = spr_taunt;
	        instance_create(x, y, obj_taunteffect);
	        instance_create(x, y, obj_parryhitbox);
	        
	        if (instance_exists(obj_pizzakinshroom))
	        {
	            obj_pizzakinshroom.taunt = 1;
	            obj_pizzakinshroom.sprite_index = spr_toppinshroom_taunt;
	            obj_pizzakinshroom.image_index = choose(0, 1, 2);
	            
	            with (instance_create(obj_pizzakinshroom.x, obj_pizzakinshroom.y, obj_bangeffect))
	            {
	                sprite_index = spr_tinytaunt;
	                image_speed = 0.5;
	            }
	        }
	        
	        if (instance_exists(obj_pizzakincheese))
	        {
	            obj_pizzakincheese.taunt = 1;
	            obj_pizzakincheese.sprite_index = spr_toppincheese_taunt;
	            obj_pizzakincheese.image_index = choose(0, 1, 2);
	            
	            with (instance_create(obj_pizzakincheese.x, obj_pizzakincheese.y, obj_bangeffect))
	            {
	                sprite_index = spr_tinytaunt;
	                image_speed = 0.5;
	            }
	        }
	        
	        if (instance_exists(obj_pizzakintomato))
	        {
	            obj_pizzakintomato.taunt = 1;
	            obj_pizzakintomato.sprite_index = spr_toppintomato_taunt;
	            obj_pizzakintomato.image_index = choose(0, 1, 2);
	            
	            with (instance_create(obj_pizzakintomato.x, obj_pizzakintomato.y, obj_bangeffect))
	            {
	                sprite_index = spr_tinytaunt;
	                image_speed = 0.5;
	            }
	        }
	        
	        if (instance_exists(obj_pizzakinsausage))
	        {
	            obj_pizzakinsausage.taunt = 1;
	            obj_pizzakinsausage.sprite_index = spr_toppinsausage_taunt;
	            obj_pizzakinsausage.image_index = choose(0, 1, 2);
	            
	            with (instance_create(obj_pizzakinsausage.x, obj_pizzakinsausage.y, obj_bangeffect))
	            {
	                sprite_index = spr_tinytaunt;
	                image_speed = 0.5;
	            }
	        }
	        
	        if (instance_exists(obj_pizzakinpineapple))
	        {
	            obj_pizzakinpineapple.taunt = 1;
	            obj_pizzakinpineapple.sprite_index = spr_toppinpineapple_taunt;
	            obj_pizzakinpineapple.image_index = choose(0, 1, 2);
	            
	            with (instance_create(obj_pizzakinpineapple.x, obj_pizzakinpineapple.y, obj_bangeffect))
	            {
	                sprite_index = spr_tinytaunt;
	                image_speed = 0.5;
	            }
	        }
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
