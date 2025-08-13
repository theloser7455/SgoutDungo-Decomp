function scr_playeraltattacks()
{
	if (character == "P")
	{
	    if ((key_punch2 && global.attackstyleP == 0) || (key_punchtwo2 && global.attackstyleP2 == 0))
	    {
	        scr_soundeffect(sfx_suplexdash2);
	        
	        if (move != 0 && state == states.kungfu)
	            xscale = move;
	        
	        instance_create(x, y, obj_jumpdust);
	        
	        if (state == states.uppercut && dir != 0)
	            xscale = dir;
	        
	        state = states.punch;
	        image_index = 0;
	        sprite_index = spr_player_attackdash;
	        
	        if (!grounded)
	            sprite_index = spr_player_airattackstart;
	        
	        if (movespeed < 12)
	            movespeed = 12;
	        
	        if (paletteselect == 17 && !global.lamepalettes)
	            scr_soundeffect(sfx_pursuerwhoop);
	        
	        flash = 1;
	    }
	    
	    if ((key_punch2 && global.attackstyleP == 1) || (key_punchtwo2 && global.attackstyleP2 == 1))
	    {
	        scr_soundeffect(sfx_suplexdash2);
	        
	        if (move != 0 && state == states.kungfu)
	            xscale = move;
	        
	        scr_soundeffect(sfx_breakdancescratch);
	        instance_create(x, y, obj_jumpdust);
	        
	        if (state == states.uppercut && dir != 0)
	            xscale = dir;
	        
	        state = states.breakdanceattack;
	        
	        if (vsp > -5)
	            vsp = -5;
	        
	        image_index = 0;
	        sprite_index = spr_player_breakdancestart;
	        flash = 1;
	        
	        if (abs(hsp) < 12)
	            hsp = 12 * xscale;
	    }
	    
	    if ((key_punch2 && global.attackstyleP == 2) || (key_punchtwo2 && global.attackstyleP2 == 2))
	    {
	        scr_soundeffect(sfx_spin);
	        scr_soundeffect(sfx_suplexdash2);
	        
	        if (move != 0 && state == states.kungfu)
	            xscale = move;
	        
	        instance_create(x, y, obj_jumpdust);
	        
	        if (state == states.uppercut && dir != 0)
	            xscale = dir;
	        
	        var a = choose(1, 0);
	        flash = 1;
	        
	        if (a == 1 && global.karatesounds)
	        {
	            var sfx = choose(sfx_kungfu1, sfx_kungfu2, sfx_kungfu3);
	            scr_soundeffect(sfx);
	        }
	        
	        if (paletteselect == 15 && !global.lamepalettes)
	        {
	            scr_soundeffect(choose(sfx_veg1, sfx_veg2, sfx_veg3, sfx_veg4));
	            scr_soundeffect(choose(sfx_vegvoice1, sfx_vegvoice2, sfx_vegvoice3));
	        }
	        
	        instance_create(x, y, obj_crazyrunothereffect);
	        state = states.kungfu;
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
	}
	
	if (character == "N")
	{
	    if ((key_punch2 && global.attackstyleN == 0) || (key_punchtwo2 && global.attackstyleN2 == 0))
	    {
	        if (move != 0)
	            xscale = move;
	        
	        if (((state == states.jetpack && sprite_index == spr_playerN_noisebombspinjump) || state == states.wallbounce || state == states.Ncrusher || state == states.Nfork || state == states.uppercut) && dir != 0)
	            xscale = dir;
	        
	        state = states.Nfork;
	        flash = 1;
	        vsp -= 5;
	        
	        if (movespeed < 10)
	            movespeed = 10;
	        else if (movespeed < 20)
	            movespeed += 3;
	        
	        scr_soundeffect(sfx_suplexdash2);
	        
	        if (paletteselect == 9 && !global.lamepalettes)
	            scr_soundeffect(sfx_vanityknife, sfx_vanityknife1, sfx_vanityknife2, sfx_vanityknife3, sfx_vanityknife4, sfx_vanityknife5);
	    }
	    
	    if ((key_punch2 && global.attackstyleN == 1) || (key_punchtwo2 && global.attackstyleN2 == 1))
	    {
	        if (((state == states.jetpack && sprite_index == spr_playerN_noisebombspinjump) || state == states.wallbounce || state == states.Ncrusher || state == states.uppercut) && dir != 0)
	            xscale = dir;
	        
	        state = states.jetpack;
	        
	        if (movespeed < 12)
	            movespeed = 12;
	        
	        if (audio_is_playing(sfx_noisejetpackstart))
	            audio_stop_sound(sfx_noisejetpackstart);
	        
	        scr_soundeffect(sfx_noisejetpackstart);
	        sprite_index = spr_playerN_jetpackstart;
	        image_index = 0;
	    }
	    
	    if ((key_punch2 && global.attackstyleN == 2) || (key_punchtwo2 && global.attackstyleN2 == 2))
	    {
	    }
	}
}
