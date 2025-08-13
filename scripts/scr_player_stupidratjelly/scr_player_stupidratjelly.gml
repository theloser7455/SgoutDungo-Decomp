function scr_player_stupidratjelly()
{
	move = key_left + key_right;
	hsp = Approach(hsp, move * 4, 0.25);
	image_speed = 0.35;
	
	if (move != 0)
	    xscale = move;
	
	if ((sprite_index != spr_uppercut1 && sprite_index != spr_uppercut2) || (floor(image_index) == (image_number - 1) && sprite_index == spr_uppercut1))
	    sprite_index = spr_uppercut2;
	
	if (grounded && vsp >= 0)
	    state = states.normal;
	
	if (key_down)
	    vsp += 1.5;
}
