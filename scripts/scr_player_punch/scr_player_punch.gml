function scr_player_punch()
{
	move = key_left + key_right;
	hsp = xscale * movespeed;
	
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
	    with (instance_create(x, y, obj_slidecloud))
	        image_xscale = other.xscale;
	}
	
	if (key_down && !place_meeting(x, y, obj_dashpad))
	{
	    if (!grounded)
	    {
	        if (vsp < 20)
	            vsp = 20;
	        
	        yscaleplus = lerp(yscaleplus, 2, 0.0625);
	        
	        if (grounded)
	            yscaleplus = 0;
	    }
	    else
	    {
	        instance_create(x, y, obj_jumpdust);
	        flash = 0;
	        state = states.machroll;
	        vsp = 10;
	        
	        if (character == "N" && !grounded)
	        {
	            state = states.wallbounce;
	            sprite_index = spr_playerN_divebombfall;
	            vsp = 20;
	        }
	    }
	}
	
	if (!key_down)
	    yscaleplus = lerp(yscaleplus, 0, 0.0625);
	
	if (!grounded)
	{
	    if (sprite_index != spr_player_airattack && sprite_index != spr_player_airattackstart)
	    {
	        sprite_index = spr_player_airattackstart;
	        image_index = 0;
	    }
	    
	    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_airattackstart)
	        sprite_index = spr_player_airattack;
	}
	
	if (grounded && sprite_index != spr_player_attackdash && vsp > 0)
	{
	    state = states.normal;
	    
	    if (key_attack && movespeed > 6)
	        state = states.mach2;
	    
	    if (move != 0)
	        xscale = move;
	}
	
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_player_attackdash) || (move == -xscale && move != 0))
	{
	    state = states.normal;
	    
	    if (key_attack && movespeed > 6)
	        state = states.mach2;
	    
	    if (move != 0)
	        xscale = move;
	}
	
	image_speed = 0.5;
	
	if (grounded)
	{
	    sprite_index = spr_player_attackdash;
	    
	    if (key_jump)
	        vsp = -11;
	}
	
	var a = 0;
	
	if (!scr_solid(x + sign(hsp), y - 32))
	{
	    a = 1;
	    
	    if (scr_solid(x + sign(hsp), y - 33))
	        a = 0;
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
	{
	    if (!a)
	    {
	        state = states.uppercut;
	        sprite_index = spr_uppercut1;
	        image_index = 0;
	        vsp = -20;
	        dir = xscale;
	        hsp = -2 * xscale;
	        scr_soundeffect(sfx_uppercut);
	        scr_soundeffect(sfx_groundpound);
	        instance_create(x + (xscale * 32), y, obj_bangeffect);
	        yscaleplus = 0;
	        
	        repeat (8)
	        {
	            with (instance_create(x, y, obj_slapstar))
	                vsp = random_range(-10, -15);
	        }
	    }
	    else
	    {
	        y -= 32;
	    }
	}
}
