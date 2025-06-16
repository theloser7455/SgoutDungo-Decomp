function scr_boss_thrown()
{
	image_speed = 0.35;
	attackin = 50;
	hsp = xscale * 12;
	sprite_index = spr_thrown;
	
	if (grounded && vsp > 0)
	{
	    state = 0;
	    immunityframes = 20;
	    hp -= 1;
	    alarm[1] = 5;
	}
	
	if (scr_solid(x + sign(hsp), y))
	    xscale *= -1;
}
