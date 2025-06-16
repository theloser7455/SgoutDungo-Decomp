function scr_playeraltattacks()
{
	if (key_punch2 && character == "P" && global.attackstyleP == 0)
	{
	    scr_soundeffect(sfx_suplexdash2);
	    state = 46;
	    image_index = 0;
	    sprite_index = spr_player_attackdash;
	    
	    if (!grounded)
	        sprite_index = spr_player_airattackstart;
	    
	    if (movespeed < 12)
	        movespeed = 12;
	}
	
	if (key_punch2 && character == "P" && global.attackstyleP == 1)
	{
	    scr_soundeffect(sfx_suplexdash2);
	    scr_soundeffect(sfx_breakdancescratch);
	    state = 94;
	    
	    if (vsp > -5)
	        vsp = -5;
	    
	    image_index = 0;
	    sprite_index = spr_player_breakdancestart;
	    
	    if (abs(hsp) < 12)
	        hsp = 12 * xscale;
	}
	
	if (key_punch2 && character == "P" && global.attackstyleP == 2)
	{
	    scr_soundeffect(sfx_suplexdash2);
	    var a = choose(1, 0);
	    
	    if (a == 1 && global.karatesounds)
	    {
	        var sfx = choose(sfx_kungfu1, sfx_kungfu2, sfx_kungfu3);
	        scr_soundeffect(sfx);
	    }
	    
	    state = 307;
	    sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
	    
	    if (movespeed < 12)
	        movespeed = 12;
	    
	    if (!grounded)
	    {
	        sprite_index = choose(spr_player_kungfuair1transition, spr_player_kungfuair2transition, spr_player_kungfuair3transition);
	        vsp = -5;
	    }
	    
	    image_index = 0;
	}
	
	if (key_punch2 && character == "N" && global.attackstyleN == 0)
	{
	    if (move != 0)
	        xscale = move;
	    
	    if ((state == 308 && sprite_index == spr_playerN_noisebombspinjump) || state == 9890 || state == 4719)
	        xscale = dir;
	    
	    state = 9459;
	    flash = 1;
	    vsp -= 5;
	    
	    if (movespeed < 10)
	        movespeed = 10;
	    else if (movespeed < 20)
	        movespeed += 3;
	    
	    scr_soundeffect(sfx_suplexdash2);
	}
	
	if (key_punch2 && character == "N" && global.attackstyleN == 1)
	{
	    if ((state == 308 && sprite_index == spr_playerN_noisebombspinjump) || state == 9890 || state == 4719)
	        xscale = dir;
	    
	    state = 308;
	    
	    if (movespeed < 12)
	        movespeed = 12;
	    
	    if (audio_is_playing(sfx_noisejetpackstart))
	        audio_stop_sound(sfx_noisejetpackstart);
	    
	    scr_soundeffect(sfx_noisejetpackstart);
	    sprite_index = spr_playerN_jetpackstart;
	    image_index = 0;
	}
	
	if (key_punch2 && character == "N" && global.attackstyleN == 2)
	{
	}
}
