function scr_player_uppercut()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * 4, 0.25);
	image_speed = 0.5;
	
	if (move != 0)
	    dir = move;
	
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_uppercut1)
	    sprite_index = spr_uppercut2;
	
	if (grounded && vsp >= 0)
	{
	    xscale = dir;
	    state = 0;
	}
	
	if (key_down)
	    vsp += 1.5;
}
