function scr_playerpepperman_fall()
{
	move = key_left + key_right;
	hsp = Approach(hsp, 6 * move, 2);
	
	if (move != 0)
	    xscale = move;
	
	if (sprite_index == spr_Pjump)
	{
	    if (floor(image_index) == (image_number - 1))
	        image_speed = 0;
	    else
	        image_speed = 0.35;
	}
	
	if (grounded && vsp > 0)
	    state = states.playerpeppermanidle;
	
	if (key_down)
	{
	    state = states.playerpeppermangroundpound;
	    image_index = 0;
	    sprite_index = spr_Pslamstart;
	    vsp = -5;
	}
}
