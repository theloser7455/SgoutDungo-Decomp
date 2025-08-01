function scr_player_machroll()
{
	if (!place_meeting(x, y + 1, obj_railh))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;
	
	mach2 = 100;
	machslideAnim = 1;
	move = key_right + key_left;
	
	if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    scr_soundeffect(sfx_bumpwall);
	    hsp = 0;
	    image_speed = 0.35;
	    flash = 0;
	    combo = 0;
	    state = 71;
	    hsp = -2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	
	if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    scr_soundeffect(sfx_bumpwall);
	    hsp = 0;
	    image_speed = 0.35;
	    flash = 0;
	    combo = 0;
	    state = 71;
	    hsp = 2.5;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x - 10, y + 10, obj_bumpeffect);
	}
	
	if (!instance_exists(obj_cloudeffect) && grounded)
	    instance_create(x, y + 43, obj_cloudeffect);
	
	if (grounded)
	{
	    sprite_index = spr_machroll;
	}
	else if (sprite_index != spr_dive && !mach2jumpguy)
	{
	    sprite_index = spr_dive;
	    vsp = 10;
	}
	
	image_speed = 0.8;
	
	if (!key_down && grounded && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
	    image_index = 0;
	    scr_soundeffect(sfx_rollgetup);
	    state = 69;
	    sprite_index = spr_rollgetup;
	    
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
	
	scr_diveevent();
}
