function scr_diveevent()
{
	if (sprite_index == spr_dive)
	{
	    if (key_jump && (sprite_index == spr_dive || sprite_index == spr_mach2jump))
	    {
	        vsp = -5;
	        state = states.freefall;
	        sprite_index = spr_poundcancel1;
	        scr_soundeffect(sfx_groundpoundstart);
	    }
	    
	    switch (character)
	    {
	        case "S":
	            state = states.snickclimbdown;
	            vsp = 15;
	            break;
	        
	        case "N":
	            state = states.wallbounce;
	            dir = xscale;
	            sprite_index = spr_playerN_divebombfall;
	            vsp = 20;
	            break;
	        
	        case "V":
	            sprite_index = spr_mach2jump;
	            state = states.freefall;
	            vsp = 15;
	            hsp = 0;
	            freefallsmash = 10;
	            break;
	    }
	}
}
