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
	    state = 69;
	    
	    if (movespeed < 10)
	        movespeed = 10;
	    
	    if (movespeed >= 12)
	    {
	        machhitAnim = 0;
	        state = 89;
	        flash = 1;
	        
	        if (sprite_index != spr_rollgetup)
	            sprite_index = spr_mach4;
	        
	        instance_create(x, y, obj_jumpdust);
	    }
	}
	
	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    movespeed = 0;
	    state = 71;
	    hsp = -2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    machslideAnim = 1;
	    machhitAnim = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	
	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    movespeed = 0;
	    state = 71;
	    hsp = 2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    machslideAnim = 1;
	    machhitAnim = 0;
	    instance_create(x - 10, y + 10, obj_bumpeffect);
	}
	
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
	{
	    with (instance_create(x, y, obj_slidecloud))
	        image_xscale = other.xscale;
	}
	
	image_speed = 0.35;
}
