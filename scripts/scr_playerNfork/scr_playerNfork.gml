function scr_playerNfork()
{
	sprite_index = spr_bigbreakspritelol;
	image_speed = movespeed / 20;
	hsp = movespeed * xscale;
	xscaleplus = lerp(xscaleplus, 0, 0.0625);
	var bumpmetal = 0;
	
	if (movespeed >= 10)
	{
	    bumpmetal = 1;
	    
	    if (!instance_exists(obj_chargeeffect))
	        instance_create(x, y, obj_chargeeffect);
	}
	
	if (key_down && !place_meeting(x, y, obj_dashpad))
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
	
	if (((scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_metalblock)) || (place_meeting(x + sign(hsp), y, obj_metalblock) && !bumpmetal)) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
	    xscale *= -1;
	    scr_soundeffect(sfx_bumpwall);
	    
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_noisewalljumpeffect;
	    
	    if (movespeed < 50)
	        movespeed *= 1.05;
	    
	    xscaleplus = movespeed / 20;
	    
	    if (movespeed > 20)
	    {
	        repeat (round(movespeed / 5))
	        {
	            with (instance_create(x, y, obj_slapstar))
	                hsp = other.xscale * random_range(0, 25);
	        }
	        
	        flash = 1;
	    }
	}
	
	if (movespeed > 20 && mach4flame <= 0)
	{
	    with (instance_create(x, y, obj_bangeffect))
	        sprite_index = spr_flamecloud;
	    
	    mach4flame = 10 / (movespeed / 10);
	}
	
	if (key_punch2 || key_punchtwo2 || key_jump || key_slap2 || movespeed <= 0)
	{
	    vsp = -5;
	    
	    if (key_jump)
	        vsp = -10;
	    
	    if (key_punch2)
	        key_punch2 = 0;
	    
	    if (key_jump2)
	        key_jump2 = 0;
	    
	    if (key_slap2)
	        key_slap2 = 0;
	    
	    state = states.mach2;
	    
	    if (movespeed == 0)
	        state = states.normal;
	}
	
	var accelerate = 0;
	var spee = grav;
	var goindown = 0;
	
	with (instance_place(x, y + 1, obj_slope))
	{
	    if (-other.xscale == sign(image_xscale))
	        goindown = 1;
	}
	
	if (scr_slope() && goindown)
	    accelerate = 1;
	
	if (grounded)
	{
	    if (!accelerate)
	        movespeed -= 0.1;
	    else
	        movespeed += spee;
	}
}
