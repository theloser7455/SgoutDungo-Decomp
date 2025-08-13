function scr_player_uppercut()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * 4, 0.25);
	image_speed = 0.5;
	
	if (move != 0)
	    dir = move;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_uppercut1)
	    sprite_index = spr_uppercut2;
	
	if (grounded && vsp >= 0)
	{
	    xscale = dir;
	    state = states.normal;
	    
	    if (key_attack && movespeed > 6)
	    {
	        state = states.mach2;
	        
	        if (movespeed >= 12)
	        {
	            state = states.mach3;
	            sprite_index = spr_mach4;
	        }
	    }
	}
	
	if (key_down)
	{
	    vsp += 1.5;
	    yscaleplus = lerp(yscaleplus, 1, 0.0625);
	}
	
	if (!key_down)
	    yscaleplus = lerp(yscaleplus, 0, 0.0625);
	
	if (key_slap2)
	{
	    if (character != "S")
	    {
	        state = states.mach2;
	        
	        if (character == "N")
	        {
	            sprite_index = spr_playerN_sidewayspin;
	            scr_soundeffect(sfx_airspinstart);
	            audio_stop_sound(sfx_airspinloop);
	        }
	        else
	        {
	            sprite_index = spr_secondjump1;
	            scr_soundeffect(sfx_spin);
	            instance_create(x, y, obj_highjumpcloud2);
	        }
	        
	        image_index = 0;
	        jumpstop = 1;
	        vsp = -8;
	        key_slap2 = 0;
	        
	        if (movespeed < 12)
	            movespeed = 12;
	        
	        if (dir != 0)
	            xscale = dir;
	    }
	    else
	    {
	        if (move != 0)
	            xscale = move;
	        
	        movespeed = 12;
	        machhitAnim = 0;
	        state = states.mach3;
	        sprite_index = spr_mach4;
	        instance_create(x, y, obj_jumpdust);
	        scr_soundeffect(choose(sfx_snickglitchnew, sfx_snickglitchnew2, sfx_snickglitchnew3, sfx_snickglitchnew4));
	        
	        if (movespeed < 12)
	            movespeed = 12;
	        
	        tauntstoredvsp = hsp;
	        tauntstoredhsp = vsp;
	        hsp = 0;
	        vsp = 0;
	        tpcd = 0;
	        tph = 60 * xscale;
	        tpv = 0;
	        tptimes = 4;
	        tauntstoredstate = state;
	        tauntstoredsprite = sprite_index;
	        tauntstoredmovespeed = movespeed + 4;
	        sprite_index = spr_secondjump2;
	        state = states.snicktp;
	    }
	}
}
