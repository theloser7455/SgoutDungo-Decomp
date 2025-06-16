function scr_player_stupidratroll()
{
	move = key_left + key_right;
	
	if (grounded)
	{
	    if (key_down)
	        squished = 1;
	    else if (!scr_solid(x, y - 3))
	        squished = 0;
	}
	
	sprite_index = spr_mach2jump;
	hsp = movespeed * xscale;
	image_speed = abs(hsp) / 20;
	
	if (key_attack)
	{
	    if (movespeed < 20)
	        movespeed += 0.5;
	}
	else
	{
	    state = 96;
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock) && !place_meeting(x + xscale, y, obj_slope))
	{
	    state = 96;
	    hsp *= -1;
	    instance_create(x, y, obj_bangeffect);
	    scr_soundeffect(ballhit);
	}
	
	if (grounded && key_jump)
	{
	    scr_soundeffect(jumpsound);
	    instance_create(x, y, obj_highjumpcloud1);
	    vsp = -13;
	}
	
	if (key_down2 && !grounded)
	{
	    image_index = 0;
	    state = 98;
	    scr_soundeffect(cheesefall);
	    sprite_index = spr_bodyslamstart;
	    vsp = -10;
	}
	
	if (move == -xscale)
	    state = 97;
}
