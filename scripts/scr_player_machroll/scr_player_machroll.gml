function scr_player_machroll()
{
	mach2 = 100;
	machslideAnim = 1;
	move = key_right + key_left;
	var bumpmetal = 0;
	
	if (movespeed >= 12)
	{
	    bumpmetal = 1;
	    
	    if (!instance_exists(obj_chargeeffect))
	        instance_create(x, y, obj_chargeeffect);
	}
	
	if (character == "V" && sprite_index == spr_mach2jump)
	{
	    hsp = Approach(hsp, move * movespeed, 1);
	    
	    if (move != 0)
	        xscale = move;
	}
	else if (!place_meeting(x, y + 1, obj_railh))
	{
	    hsp = xscale * movespeed;
	}
	else if (place_meeting(x, y + 1, obj_railh))
	{
	    hsp = (xscale * movespeed) - 5;
	}
	else if (place_meeting(x, y + 1, obj_railh2))
	{
	    hsp = (xscale * movespeed) + 5;
	}
	
	var a = 0;
	
	if (!scr_solid(x + sign(hsp), y - 32))
	{
	    a = 1;
	    
	    if (scr_solid(x + sign(hsp), y - 33))
	        a = 0;
	}
	
	if (!instance_exists(obj_cloudeffect) && grounded)
	    instance_create(x, y + 43, obj_cloudeffect);
	
	var diveNOW = 1;
	
	if (sprite_index == spr_mach2jump && character == "V")
	    diveNOW = 0;
	
	if (grounded)
	{
	    sprite_index = spr_machroll;
	    
	    if (character == "S")
	        state = states.mach2;
	}
	else if (sprite_index != spr_dive && diveNOW)
	{
	    sprite_index = spr_dive;
	    vsp = 10;
	}
	
	image_speed = 0.8;
	
	if (!key_down && grounded && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
	    image_index = 0;
	    scr_soundeffect(sfx_rollgetup);
	    state = states.mach2;
	    sprite_index = spr_rollgetup;
	    
	    if (movespeed >= 12)
	    {
	        machhitAnim = 0;
	        state = states.mach3;
	        flash = 1;
	        
	        if (sprite_index != spr_rollgetup)
	            sprite_index = spr_mach4;
	        
	        instance_create(x, y, obj_jumpdust);
	    }
	}
	
	if (key_down && sprite_index == spr_mach2jump)
	    vsp++;
	
	scr_diveevent();
	
	if (((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_metalblock)) || (place_meeting(x + sign(hsp), y, obj_metalblock) && !bumpmetal)) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    if (!a)
	    {
	        scr_soundeffect(sfx_bumpwall);
	        hsp = 0;
	        image_speed = 0.35;
	        flash = 0;
	        combo = 0;
	        state = states.bump;
	        hsp = 0;
	        vsp = 0;
	        mach2 = 0;
	        image_index = 0;
	        sprite_index = wallsplatspr;
	    }
	    else
	    {
	        y -= 32;
	    }
	}
}
