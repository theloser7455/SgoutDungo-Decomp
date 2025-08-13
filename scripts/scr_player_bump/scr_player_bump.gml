function scr_player_bump()
{
	movespeed = 0;
	mach2 = 0;
	start_running = 1;
	alarm[4] = 14;
	move = key_left + key_right;
	
	if (sprite_index == suplexdashbump)
	{
	    hsp = Approach(hsp, move * 8, 1);
	    
	    if (move != 0)
	        xscale = move;
	}
	
	if (sprite_index == wallsplatspr)
	{
	    hsp = 0;
	    vsp = 0;
	}
	
	if (grounded && vsp > 0)
	    hsp = 0;
	
	if ((floor(image_index) == (image_number - 1) && sprite_index != suplexdashbump) || (grounded && sprite_index == suplexdashbump))
	{
	    state = 0;
	    
	    if (pepperplay)
	        state = states.playerpeppermanidle;
	}
	
	if (sprite_index != spr_player_catched && sprite_index != spr_player_tumbleend && sprite_index != spr_hitwall && sprite_index != spr_Pmachhitwall && sprite_index != suplexdashbump && sprite_index != wallsplatspr)
	    sprite_index = spr_bump;
	
	image_speed = 0.35;
}
