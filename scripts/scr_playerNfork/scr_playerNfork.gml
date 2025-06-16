function scr_playerNfork()
{
	sprite_index = spr_bigbreakspritelol;
	image_speed = movespeed / 20;
	hsp = movespeed * xscale;
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
	    state = 36;
	    vsp = 10;
	    
	    if (character == "N" && !grounded)
	    {
	        state = 9890;
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
	}
	
	if (key_punch2 || key_jump || key_slap2 || movespeed <= 0)
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
	    
	    state = 69;
	    
	    if (movespeed == 0)
	        state = 0;
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
