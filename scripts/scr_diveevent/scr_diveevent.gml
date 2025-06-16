function scr_diveevent()
{
	if (sprite_index == spr_dive)
	{
	    if (key_jump && (sprite_index == spr_dive || sprite_index == spr_mach2jump))
	    {
	        vsp = -5;
	        state = 73;
	        sprite_index = spr_poundcancel1;
	        scr_soundeffect(sfx_loseknight);
	    }
	    
	    switch (character)
	    {
	        case "S":
	            state = 93;
	            vsp = 15;
	            break;
	        
	        case "N":
	            state = 9890;
	            dir = xscale;
	            sprite_index = spr_playerN_divebombfall;
	            vsp = 20;
	            break;
	    }
	}
}
