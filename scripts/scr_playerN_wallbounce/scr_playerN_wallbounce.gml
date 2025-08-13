function scr_playerN_wallbounce()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * movespeed, 1);
	
	if (character != "V")
	{
	    if (move == -xscale)
	        movespeed = 12;
	    
	    if (movespeed < 12)
	        movespeed = 12;
	    
	    image_speed = 0.5;
	    
	    if (move != 0)
	        dir = move;
	    
	    if (key_down && character != "P")
	    {
	        vsp = 20;
	        
	        if (sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombland && sprite_index != spr_playerN_divebombfall)
	            sprite_index = spr_playerN_divebomb;
	        
	        if (sprite_index != spr_playerN_divebombfall && !grounded)
	            sprite_index = spr_playerN_divebombfall;
	        
	        if (sprite_index == spr_playerN_divebombfall && grounded)
	        {
	            image_index = 0;
	            sprite_index = spr_playerN_divebombland;
	        }
	        
	        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_divebombland)
	            sprite_index = spr_playerN_divebomb;
	        
	        var xx = hsp;
	        
	        if (xx == 0)
	            xx = xscale;
	        
	        if (grounded && vsp > 0 && place_meeting(x + xx, y, obj_solid) && !place_meeting(x + xx, y, obj_destructibles))
	        {
	            mask_index = spr_crouchmask;
	            
	            if (!place_meeting(x + xx, y, obj_solid) || place_meeting(x + xx, y, obj_destructibles))
	            {
	                flash = 0;
	                state = states.machroll;
	                movespeed = 12;
	                vsp = 10;
	                xscale = dir;
	            }
	        }
	        
	        blur--;
	        
	        if (blur <= 0)
	        {
	            if (grounded && vsp > 0)
	            {
	                with (instance_create(x, bbox_bottom, obj_baddiegibs))
	                {
	                    vsp = -2;
	                    hsp = random_range(5, -5);
	                    sprite_index = spr_noisedrilldebris;
	                }
	                
	                blur = 4;
	            }
	        }
	    }
	    
	    if (!key_down && grounded && (sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombland || sprite_index == spr_playerN_divebombfall))
	    {
	        vsp = -8;
	        sprite_index = spr_playerN_wallbounce;
	        
	        with (instance_create(x, y, obj_bangeffect))
	            sprite_index = spr_noisewalljumpeffect;
	        
	        scr_soundeffect(sfx_wallbouncebounce);
	    }
	    
	    if (key_slap2 && !key_up)
	    {
	        state = states.mach2;
	        
	        if (character != "P")
	        {
	            sprite_index = spr_playerN_sidewayspin;
	            scr_soundeffect(sfx_airspinstart);
	        }
	        else
	        {
	            sprite_index = spr_secondjump1;
	            scr_soundeffect(sfx_jump);
	        }
	        
	        image_index = 0;
	        jumpstop = 1;
	        
	        if (vsp > -8)
	            vsp = -8;
	        
	        key_slap2 = 0;
	        audio_stop_sound(sfx_airspinloop);
	        xscale = dir;
	        
	        with (instance_create(x, y, obj_crazyrunothereffect))
	            image_xscale = other.xscale;
	        
	        if (key_down && grounded)
	        {
	            instance_create(x, y, obj_jumpdust);
	            flash = 0;
	            state = states.machroll;
	            vsp = 10;
	        }
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
	    
	    if (grounded && vsp >= 0 && sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombland && sprite_index != spr_playerN_divebombfall)
	    {
	        state = states.normal;
	        movespeed = abs(movespeed);
	        xscale = dir;
	        
	        if (move != 0)
	            xscale = move;
	        
	        if (key_attack && movespeed > 6)
	        {
	            state = states.mach2;
	            
	            if (movespeed >= 12)
	            {
	                state = states.mach3;
	                sprite_index = spr_mach4;
	            }
	        }
	        
	        scr_soundeffect(sfx_noisewallbounceland);
	    }
	}
	else
	{
	    key_jump2 = 0;
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_bombexplosion;
	    
	    scr_soundeffect(sfx_explosion);
	    vsp = -5;
	    state = states.normal;
	    
	    if (key_up)
	    {
	        vsp = -15;
	        
	        if (move == 0)
	        {
	            scr_soundeffect(superjumpsound);
	            instance_create(x, y, obj_explosioneffect);
	            sprite_index = spr_superjump;
	            state = states.Sjump;
	            vsp = -15;
	        }
	    }
	    
	    if (key_down)
	    {
	        vsp = 15;
	        
	        if (move == 0)
	        {
	            state = states.freefall;
	            sprite_index = spr_mach2jump;
	            flash = 1;
	        }
	    }
	    
	    if (move != 0 && !scr_solid(x + move, y))
	    {
	        xscale = move;
	        
	        if (movespeed < 15)
	            movespeed = 15;
	        
	        machhitAnim = 0;
	        state = states.mach3;
	        flash = 1;
	        
	        if (sprite_index != spr_rollgetup)
	            sprite_index = spr_mach4;
	        
	        instance_create(x, y, obj_jumpdust);
	    }
	}
}
