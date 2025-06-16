function scr_player_NEWchainsaw()
{
	move = key_left + key_right;
	image_speed = 0.35;
	
	if (sprite_index == spr_player_chainsawpogobounce || sprite_index == spr_player_chainsawpogo2)
	{
	    hsp = Approach(hsp, movespeed * move, 1);
	    
	    if (move == -xscale)
	        movespeed = 8;
	    
	    if (grounded && vsp >= 0)
	    {
	        vsp = -15;
	        sprite_index = spr_player_chainsawpogobounce;
	        image_index = 0;
	        
	        if (move != 0)
	            xscale = move;
	        
	        if (!key_slap)
	        {
	            state = 0;
	            vsp = 0;
	        }
	        else
	        {
	            scr_soundeffect(sfx_bam);
	        }
	    }
	    
	    if (key_down)
	        vsp++;
	}
	else
	{
	    hsp = movespeed * xscale;
	}
	
	if (floor(image_index) == (image_number - 1))
	{
	    switch (sprite_index)
	    {
	        case spr_player_chainsawpogobounce:
	            sprite_index = spr_player_chainsawpogo2;
	            break;
	        
	        case spr_player_chainsaw:
	            state = 0;
	            break;
	    }
	}
}
