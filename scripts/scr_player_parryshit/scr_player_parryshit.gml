function scr_player_parryshit()
{
	image_speed = 0.5;
	hsp = Approach(hsp, 0, 0.75);
	
	if (floor(image_index) == (image_number - 1))
	    state = states.normal;
}
