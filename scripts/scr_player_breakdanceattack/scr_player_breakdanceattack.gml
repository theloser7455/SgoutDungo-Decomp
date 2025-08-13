function scr_player_breakdanceattack()
{
	image_speed = 0.5;
	
	if (sprite_index == spr_player_buttattackend && hsp == 0)
	{
	    state = states.normal;
	    movespeed = 0;
	}
	
	if (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_buttattackend)
	{
	    hsp = Approach(hsp, 0, 0.5);
	    
	    if (instance_exists(obj_chargeeffect))
	        instance_destroy(obj_chargeeffect);
	}
	else
	{
	    hsp = movespeed * xscale;
	    
	    if (!instance_exists(obj_chargeeffect))
	        instance_create(x, y, obj_chargeeffect);
	}
	
	if (sprite_index == spr_player_breakdancestart)
	{
	    if (key_punch2 || key_punchtwo2)
	    {
	        if (key_punch2)
	            key_punch2 = 0;
	        
	        if (key_punchtwo2)
	            key_punchtwo2 = 0;
	        
	        sprite_index = spr_player_buttattackstart;
	        image_index = 0;
	        scr_soundeffect(sfx_suplexdash2);
	        vsp = -5;
	        
	        if (movespeed < 16)
	            movespeed = 16;
	        
	        with (instance_create(x, y, obj_crazyrunothereffect))
	            image_xscale = other.xscale;
	        
	        repeat (2)
	            instance_create(x, y, obj_noisetornadoeffect);
	    }
	}
	
	if (floor(image_index) == (image_number - 1))
	{
	    if (sprite_index == spr_player_breakdancestart)
	    {
	        state = states.normal;
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
	        state = states.mach2;
	}
	
	var a = 0;
	
	if (!scr_solid(x + sign(hsp), y - 32))
	{
	    a = 1;
	    
	    if (scr_solid(x + sign(hsp), y - 33))
	        a = 0;
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock) && (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart))
	{
	    if (key_attack)
	    {
	        state = states.mach2;
	    }
	    else if (!a)
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
	
	if (key_down2)
	{
	    if (vsp < 40)
	        vsp = 40;
	    else
	        vsp += 40;
	}
	
	if (vsp >= 40)
	    yscaleplus = lerp(yscaleplus, 2 * (vsp / 40), 0.0625);
	else if (grounded)
	    yscaleplus = 0;
	
	if (key_up)
	{
	    scr_soundeffect(sfx_uppercut);
	    state = states.uppercut;
	    sprite_index = spr_player_breakdanceuppercut;
	    vsp = -20;
	    flash = 1;
	    
	    with (instance_create(x, y - 30, obj_bangeffect))
	        sprite_index = spr_player_firemouthjumpdust;
	    
	    repeat (2)
	        instance_create(x, y, obj_noisetornadoeffect);
	    
	    if (character == "N")
	        vsp = -24;
	}
}
