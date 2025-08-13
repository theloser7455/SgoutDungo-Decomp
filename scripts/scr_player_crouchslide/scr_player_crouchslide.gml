function scr_player_crouchslide()
{
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;
	
	if (sprite_index != spr_dive && !mach2jumpguy && !grounded)
	{
	    sprite_index = spr_dive;
	    vsp = 10;
	}
	
	var bumpmetal = 0;
	
	if (movespeed >= 12)
	{
	    bumpmetal = 1;
	    
	    if (!instance_exists(obj_chargeeffect))
	        instance_create(x, y, obj_chargeeffect);
	}
	
	if (grounded)
	    sprite_index = spr_crouchslip;
	
	scr_diveevent();
	mask_index = spr_crouchmask;
	
	repeat (2)
	    mach2++;
	
	if (mach2 >= 35 && !key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16) && sprite_index != spr_player_shootslide && grounded)
	{
	    sprite_index = spr_rollgetup;
	    mach2 = 35;
	    state = states.mach2;
	    
	    if (movespeed < 10)
	        movespeed = 10;
	    
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
	
	var a = 0;
	
	if (!scr_solid(x + sign(hsp), y - 32))
	{
	    a = 1;
	    
	    if (scr_solid(x + sign(hsp), y - 33))
	        a = 0;
	}
	
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
	
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
	    with (instance_create(x, y, obj_slidecloud))
	        image_xscale = other.xscale;
	}
	
	image_speed = 0.35;
}
