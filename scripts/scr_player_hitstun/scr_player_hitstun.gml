function scr_player_hitstun()
{
	image_speed = 0;
	hsp = 0;
	vsp = 0;
	taunttimer--;
	
	if (taunttimer == 0)
	{
	    movespeed = tauntstoredmovespeed;
	    sprite_index = tauntstoredsprite;
	    state = tauntstoredstate;
	    hsp = tauntstoredhsp;
	    vsp = tauntstoredvsp;
	}
}
