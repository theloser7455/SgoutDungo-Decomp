function scr_player_kungfu()
{
	image_speed = 0.35;
	move = key_left + key_right;
	hsp = xscale * movespeed;
	
	if (key_down2)
	    vsp += 10;
	
	if (move == -xscale && movespeed > -12)
	    movespeed -= 1;
	
	if (move == xscale && movespeed < 12)
	    movespeed += 1;
	
	switch (sprite_index)
	{
	    case spr_player_kungfu1:
	    case spr_player_kungfu2:
	    case spr_player_kungfu3:
	        if (floor(image_index) == (image_number - 1))
	        {
	            movespeed = abs(movespeed);
	            state = 0;
	            
	            if (key_attack && movespeed > 6)
	                state = 69;
	            
	            if (move != 0)
	                xscale = move;
	        }
	        
	        break;
	    
	    default:
	        if (floor(image_index) == (image_number - 1))
	        {
	            switch (sprite_index)
	            {
	                case spr_player_kungfuair1transition:
	                    sprite_index = spr_player_kungfuair1;
	                    break;
	                
	                case spr_player_kungfuair2transition:
	                    sprite_index = spr_player_kungfuair2;
	                    break;
	                
	                case spr_player_kungfuair3transition:
	                    sprite_index = spr_player_kungfuair3;
	                    break;
	            }
	        }
	        
	        if (grounded && vsp > 0)
	        {
	            movespeed = abs(movespeed);
	            state = 0;
	            
	            if (key_attack && movespeed > 6)
	                state = 69;
	            
	            if (move != 0)
	                xscale = move;
	        }
	        
	        break;
	}
	
	if (scr_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) && !scr_slope() && sprite_index != spr_player_kungfujump)
	{
	    sprite_index = spr_player_kungfujump;
	    vsp = -3;
	    movespeed = -12;
	}
}
