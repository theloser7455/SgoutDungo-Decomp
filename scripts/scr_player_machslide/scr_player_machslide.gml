function scr_player_machslide()
{
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;
	
	move = key_right + key_left;
	
	if (movespeed >= 0)
	    movespeed -= 0.4;
	
	if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
	    sprite_index = spr_machslide;
	
	image_speed = 0.35;
	landAnim = 0;
	
	if (floor(movespeed) <= 0 && (sprite_index == spr_machslide || sprite_index == spr_player_crouchslide || sprite_index == spr_Pstop))
	{
	    state = 0;
	    
	    if (pepperplay)
	        state = states.playerpeppermanidle;
	    
	    image_index = 0;
	    
	    if (sprite_index == spr_machslide)
	        machslideAnim = 1;
	    
	    movespeed = 0;
	}
	
	if (place_meeting(x + xscale, y, obj_solid) && (sprite_index == spr_machslide || sprite_index == spr_machslidestart))
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
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost)
	    sprite_index = spr_slidefall;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost3)
	    sprite_index = spr_slidefall3;
	
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost && grounded) || (sprite_index == spr_slidefall && grounded))
	{
	    hsp = 0;
	    image_index = 0;
	    xscale *= -1;
	    movespeed = 8;
	    state = states.mach2;
	}
	
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost3 && grounded) || (sprite_index == spr_slidefall3 && grounded))
	{
	    hsp = 0;
	    sprite_index = spr_mach4;
	    image_index = 0;
	    xscale *= -1;
	    movespeed = 12;
	    state = states.mach3;
	}
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_Pturn)
	{
	    if (grounded)
	    {
	        hsp = 0;
	        sprite_index = spr_Pmach;
	        image_index = 0;
	        xscale *= -1;
	        movespeed = 12;
	        state = states.playerpeppermanmach;
	    }
	    
	    image_speed = 0;
	}
	
	if (sprite_index == spr_player_crouchslide && movespeed == 0 && grounded)
	{
	    facehurt = 1;
	    state = 0;
	    sprite_index = spr_player_facehurtup;
	}
	
	if (mach2 == 0)
	{
	    if (!instance_exists(obj_slidecloud) && grounded)
	    {
	        with (instance_create(x, y, obj_slidecloud))
	            image_xscale = other.xscale;
	    }
	}
	else if (mach2 >= 35)
	{
	    if (!instance_exists(obj_dashcloud) && grounded)
	    {
	        with (instance_create(x, y, obj_dashcloud))
	            image_xscale = other.xscale;
	    }
	}
	else if (mach2 >= 100)
	{
	    if (!instance_exists(obj_dashcloud2) && grounded)
	    {
	        with (instance_create(x, y, obj_dashcloud2))
	            image_xscale = other.xscale;
	    }
	}
}
