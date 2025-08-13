function scr_playerpepperman_idle()
{
	move = key_left + key_right;
	var raildir = 0;
	
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    raildir = 0;
	else if (place_meeting(x, y + 1, obj_railh))
	    raildir = -1;
	else if (place_meeting(x, y + 1, obj_railh2))
	    raildir = 1;
	
	hsp = Approach(hsp, (6 * move) + (raildir * 5), 2);
	
	if (move != 0)
	{
	    xscale = move;
	    sprite_index = spr_Pmove;
	}
	else
	{
	    sprite_index = spr_Pidle;
	}
	
	image_speed = 0.35;
	
	if (key_jump && grounded)
	{
	    scr_soundeffect(sfx_jump);
	    sprite_index = spr_Pjump;
	    
	    with (instance_create(x, y, obj_highjumpcloud2))
	        image_xscale = other.xscale;
	    
	    vsp = -11;
	    state = states.playerpeppermanfall;
	    image_index = 0;
	}
	
	if (!grounded)
	{
	    sprite_index = spr_Pjump;
	    state = states.playerpeppermanfall;
	    image_index = image_number - 1;
	}
	
	if (key_attack)
	{
	    state = states.playerpeppermanmach;
	    sprite_index = spr_Pmachstart;
	    image_index = 0;
	    movespeed = 12;
	}
}
