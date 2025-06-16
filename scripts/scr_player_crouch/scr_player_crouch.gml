function scr_player_crouch()
{
	move = key_left + key_right;
	var raildir = 0;
	
	if (character != "S")
	{
	    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	        raildir = 0;
	    else if (place_meeting(x, y + 1, obj_railh))
	        raildir = -1;
	    else if (place_meeting(x, y + 1, obj_railh2))
	        raildir = 1;
	}
	
	var maxspd = 4;
	
	if (character == "R")
	    maxspd = 8;
	
	hsp = Approach(hsp, (maxspd * move) + (raildir * 5), 1);
	movespeed = 4;
	mask_index = spr_crouchmask;
	turning = 0;
	
	if (!grounded && !key_jump)
	{
	    jumpAnim = 0;
	    state = 66;
	    movespeed = 4;
	    crouchAnim = 1;
	    image_index = 0;
	}
	
	if (grounded && !key_down && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && !key_jump)
	{
	    state = 0;
	    movespeed = 0;
	    crouchAnim = 1;
	    jumpAnim = 1;
	    image_index = 0;
	    mask_index = spr_player_mask;
	}
	
	if (crouchAnim == 0)
	{
	    if (move == 0)
	    {
	        if (shotgunAnim == 0)
	            sprite_index = spr_crouch;
	        else
	            sprite_index = spr_shotgun_duck;
	    }
	    
	    if (move != 0)
	    {
	        if (shotgunAnim == 0)
	            sprite_index = spr_crawl;
	        else
	            sprite_index = spr_shotgun_crawl;
	    }
	}
	
	if (crouchAnim == 1)
	{
	    if (move == 0)
	    {
	        if (shotgunAnim == 0)
	            sprite_index = spr_couchstart;
	        else
	            sprite_index = spr_shotgun_goduck;
	        
	        if (floor(image_index) == (image_number - 1))
	            crouchAnim = 0;
	    }
	}
	
	if (move != 0)
	{
	    xscale = move;
	    crouchAnim = 0;
	}
	
	if (key_jump && grounded && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && character != "S")
	{
	    scr_soundeffect(jumpsound);
	    vsp = -8;
	    state = 66;
	    movespeed = 4;
	    image_index = 0;
	    crouchAnim = 1;
	    jumpAnim = 1;
	}
	
	if (key_slap2 && grounded && vsp >= 0 && character != "R")
	{
	    grav = 0.5;
	    sprite_index = spr_crouchslip;
	    
	    if (character == "P")
	        machhitAnim = 0;
	    
	    state = 67;
	    mach2 = 0;
	    movespeed = 15;
	    scr_soundeffect(sfx_suplexdash2);
	}
	
	image_speed = 0.45;
}
