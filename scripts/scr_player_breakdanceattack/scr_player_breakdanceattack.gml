function scr_player_breakdanceattack()
{
	image_speed = 0.5;
	
	if (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_buttattackend)
	    hsp = Approach(hsp, 0, 0.5);
	else
	    hsp = movespeed * xscale;
	
	if (sprite_index == spr_player_breakdancestart)
	{
	    if (key_punch2)
	    {
	        sprite_index = spr_player_buttattackstart;
	        image_index = 0;
	        scr_soundeffect(sfx_suplexdash2);
	        vsp = -5;
	        
	        if (movespeed < 16)
	            movespeed = 16;
	    }
	}
	
	if (floor(image_index) == (image_number - 1))
	{
	    if (sprite_index == spr_player_breakdancestart)
	    {
	        state = 0;
	        movespeed = 0;
	    }
	    
	    if (sprite_index == spr_player_buttattackstart)
	        sprite_index = spr_player_buttattack;
	}
	
	if ((sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart) && grounded && vsp > 0)
	{
	    if (!key_attack)
	        sprite_index = spr_player_buttattackend;
	    else
	        state = 69;
	}
	
	if (sprite_index == spr_player_buttattackend && hsp == 0)
	{
	    state = 0;
	    movespeed = 0;
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && sprite_index != spr_player_buttattack && sprite_index != spr_player_buttattackstart)
	{
	    scr_soundeffect(sfx_bumpwall);
	    hsp = 0;
	    image_speed = 0.35;
	    flash = 0;
	    combo = 0;
	    state = 71;
	    hsp = -2.5 * xscale;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart))
	{
	    if (key_attack)
	    {
	        state = 69;
	    }
	    else
	    {
	        scr_soundeffect(sfx_bumpwall);
	        hsp = 0;
	        image_speed = 0.35;
	        flash = 0;
	        combo = 0;
	        state = 71;
	        hsp = -2.5 * xscale;
	        vsp = -3;
	        mach2 = 0;
	        image_index = 0;
	        instance_create(x + 10, y + 10, obj_bumpeffect);
	    }
	}
	
	if (key_down2)
	{
	    if (vsp < 40)
	        vsp = 40;
	    else
	        vsp += 40;
	}
	
	if (key_up)
	{
	    scr_soundeffect(sfx_uppercut);
	    state = 100;
	    sprite_index = spr_player_breakdanceuppercut;
	    vsp = -15;
	    
	    if (character == "N")
	        vsp = -24;
	}
}
