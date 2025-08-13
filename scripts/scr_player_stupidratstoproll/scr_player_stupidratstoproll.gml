function scr_player_stupidratstoproll()
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
	    state = states.stupidratcheeseslam;
	    sprite_index = spr_bodyslamstart;
	    scr_soundeffect(cheesefall);
	    vsp = -10;
	}
	
	move = key_left + key_right;
	image_speed = abs(hsp) / 20;
	sprite_index = spr_mach2jump;
	hsp = Approach(hsp, 0, 1);
	
	if (hsp == 0)
	{
	    if (key_attack)
	    {
	        state = states.stupidratroll;
	        scr_soundeffect(turnintoball);
	        
	        if (move != 0)
	            xscale = move;
	    }
	    else
	    {
	        state = states.normal;
	        squished = 0;
	        movespeed = 0;
	    }
	}
	
	if (grounded && key_jump)
	{
	    scr_soundeffect(sfx_jump);
	    instance_create(x, y, obj_highjumpcloud1);
	    vsp = -13;
	}
}
