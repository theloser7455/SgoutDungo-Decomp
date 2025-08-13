function scr_player_jetpack()
{
	image_speed = 0.5;
	move = key_right + key_left;
	
	if (movespeed < 20 && sprite_index != spr_playerN_noisebombspinjump)
	    movespeed += 0.25;
	
	var a = 0;
	
	if (key_up)
	    a = -1;
	
	if (key_down)
	    a = 1;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_jetpackstart)
	    sprite_index = spr_playerN_jetpackboost;
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_slope))
	{
	    movespeed = 12;
	    hsp = xscale * -12;
	    dir = xscale;
	    xscale *= -1;
	    vsp = -10;
	    instance_create(x + (dir * 32), y, obj_bangeffect);
	    scr_soundeffect(sfx_groundpound);
	    sprite_index = spr_playerN_noisebombspinjump;
	    xscaleplus = -0.5;
	}
	
	switch (sprite_index)
	{
	    case spr_playerN_noisebombspinjump:
	        hsp = Approach(hsp, movespeed * move, 2);
	        
	        if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !key_down && dir == sign(hsp) && !scr_slope() && !place_meeting(x + xscale, y, obj_slope))
	        {
	            vsp = -10;
	            hsp = dir * -12;
	            xscale *= -1;
	            instance_create(x + (dir * 32), y, obj_bangeffect);
	            scr_soundeffect(sfx_groundpound);
	        }
	        
	        if (key_down)
	            vsp += 1;
	        
	        if (move == -dir)
	            movespeed = 12;
	        
	        if (move != 0)
	            dir = move;
	        
	        if (grounded && vsp > 0)
	        {
	            state = states.normal;
	            xscale = dir;
	        }
	        
	        if (key_slap2 && !key_up)
	        {
	            state = states.mach2;
	            sprite_index = spr_playerN_sidewayspin;
	            scr_soundeffect(sfx_airspinstart);
	            image_index = 0;
	            jumpstop = 1;
	            
	            if (vsp > -8)
	                vsp = -8;
	            
	            key_slap2 = 0;
	            audio_stop_sound(sfx_airspinloop);
	            xscale = dir;
	            
	            with (instance_create(x, y, obj_crazyrunothereffect))
	                image_xscale = other.xscale;
	        }
	        
	        if (character == "N" && key_jump && key_up && !grounded)
	        {
	            state = states.Ncrusher;
	            sprite_index = spr_playerN_noisecrusherstart;
	            image_index = 0;
	            vsp = -16;
	            scr_soundeffect(sfx_noisedoublejumper);
	            dir = xscale;
	        }
	        
	        if (scr_solid(x + 7, y) && scr_solid(x - 7, y) && scr_solid(x, y - 7))
	        {
	            sprite_index = spr_superjumpland;
	            scr_soundeffect(sfx_groundpound);
	            image_index = 0;
	            state = states.Sjumpland;
	            machhitAnim = 0;
	        }
	        
	        break;
	    
	    default:
	        hsp = movespeed * xscale;
	        vsp = 0 + (6 * a);
	        
	        if (key_jump)
	        {
	            vsp = -10;
	            dir = xscale;
	            
	            if (movespeed < 12)
	                movespeed = 12;
	            
	            sprite_index = spr_playerN_noisebombspinjump;
	        }
	        
	        if (!instance_exists(obj_chargeeffect))
	            instance_create(x, y, obj_chargeeffect);
	        
	        if (key_down && grounded)
	            sprite_index = spr_playerN_jetpackslide;
	        
	        if ((!key_down || !grounded) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16) && sprite_index == spr_playerN_jetpackslide)
	            sprite_index = spr_playerN_jetpackboost;
	        
	        if (mach4flame <= 0)
	        {
	            var m = 0;
	            
	            if (mask_index == spr_crouchmask)
	                m = 16;
	            
	            with (instance_create(x + (xscale * -32), y + 8 + m, obj_bangeffect))
	            {
	                sprite_index = spr_flamecloud;
	                image_angle = 90;
	                
	                if (other.xscale == -1)
	                    image_angle = -90;
	            }
	            
	            mach4flame = 2;
	        }
	        
	        break;
	}
}
