function scr_player_stupidratturnroll()
{
	if (grounded)
	{
	    if (key_down)
	        squished = 1;
	    else if (!scr_solid(x, y - 3))
	        squished = 0;
	}
	
	if (key_down2 && !grounded)
	{
	    image_index = 0;
	    state = 98;
	    sprite_index = spr_bodyslamstart;
	    scr_soundeffect(cheesefall);
	    vsp = -10;
	}
	
	move = key_left + key_right;
	image_speed = abs(hsp) / 20;
	sprite_index = spr_mach2jump;
	hsp = Approach(hsp, 0, 1);
	
	if (hsp == 0 && grounded)
	{
	    xscale *= -1;
	    state = 95;
	}
	
	if (grounded && key_jump)
	{
	    scr_soundeffect(jumpsound);
	    instance_create(x, y, obj_highjumpcloud1);
	    vsp = -13;
	}
}
