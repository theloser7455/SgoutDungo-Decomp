function scr_player_comingoutdoor()
{
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 1;
	machhitAnim = 0;
	hsp = 0;
	
	if (floor(image_index) == (image_number - 1))
	{
	    start_running = 1;
	    movespeed = 0;
	    state = 0;
	    image_alpha = 1;
	}
	
	sprite_index = spr_walkfront;
	image_speed = 0.35;
	
	if (character == "R")
	    image_speed = 0.175;
}
