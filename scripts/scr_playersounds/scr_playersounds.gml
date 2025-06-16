function scr_playersounds()
{
	if (state == 68 && !audio_is_playing(mach1sound) && grounded)
	    scr_soundeffect(mach1sound);
	else if (state != 68 || !grounded || move == -xscale)
	    audio_stop_sound(mach1sound);
	
	if ((sprite_index == spr_mach || state == 16) && !audio_is_playing(mach2sound))
	    scr_soundeffect(mach2sound);
	else if (sprite_index != spr_mach && state != 16)
	    audio_stop_sound(mach2sound);
	
	if ((state == 89 || sprite_index == spr_player_machslideboost3) && sprite_index != spr_crazyrun && !audio_is_playing(mach3sound))
	    scr_soundeffect(mach3sound);
	else if ((state != 89 && sprite_index != spr_player_machslideboost3) || sprite_index == spr_crazyrun)
	    audio_stop_sound(mach3sound);
	
	if ((state == 17 || state == 44 || (state == 9459 && grounded)) && !audio_is_playing(sfx_knightslide))
	    scr_soundeffect(sfx_knightslide);
	else if (state != 17 && state != 44 && ((state == 9459 && !grounded) || state != 9459) && audio_is_playing(sfx_knightslide))
	    audio_stop_sound(sfx_knightslide);
	
	if ((sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode) && !audio_is_playing(sfx_bombpep1))
	    scr_soundeffect(sfx_bombpep1);
	else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && audio_is_playing(sfx_bombpep1))
	    audio_stop_sound(sfx_bombpep1);
	
	if (sprite_index == spr_crazyrun && !audio_is_playing(mach4sound))
	    scr_soundeffect(mach4sound);
	else if (sprite_index != spr_crazyrun)
	    audio_stop_sound(mach4sound);
	
	if (state != 64 && audio_is_playing(superjumpprepsound))
	    audio_stop_sound(superjumpprepsound);
	
	if (state != 64 && audio_is_playing(superjumpholdsound))
	    audio_stop_sound(superjumpholdsound);
	
	if (sprite_index == spr_player_tumblestart && !audio_is_playing(sfx_tumble1) && floor(image_index) < 11)
	    scr_soundeffect(sfx_tumble1);
	
	if (sprite_index == spr_player_tumblestart && floor(image_index) == 11 && !audio_is_playing(sfx_tumble2))
	{
	    scr_soundeffect(sfx_tumble2);
	    audio_stop_sound(sfx_tumble1);
	}
	
	if ((sprite_index == spr_player_tumble || sprite_index == spr_machroll) && !audio_is_playing(sfx_tumble3))
	    scr_soundeffect(sfx_tumble3);
	
	if (state != 1 && sprite_index != spr_machroll)
	{
	    audio_stop_sound(sfx_tumble1);
	    audio_stop_sound(sfx_tumble2);
	    audio_stop_sound(sfx_tumble3);
	}
	
	if (audio_is_playing(sfx_suplexdash) && state != 21)
	    audio_stop_sound(sfx_suplexdash);
	
	if (sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend)
	{
	    if (!audio_is_playing(sfx_airspinstart) && !audio_is_playing(sfx_airspinloop))
	        scr_soundeffect(sfx_airspinloop);
	}
	else if (audio_is_playing(sfx_airspinloop))
	{
	    audio_stop_sound(sfx_airspinloop);
	}
	
	if (sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombland || sprite_index == spr_playerN_divebombfall)
	{
	    if (grounded)
	    {
	        if (!audio_is_playing(sfx_tornadogrounded))
	            scr_soundeffect(sfx_tornadogrounded);
	        
	        if (audio_is_playing(sfx_tornadoungroned))
	            audio_stop_sound(sfx_tornadoungroned);
	    }
	    else
	    {
	        if (!audio_is_playing(sfx_tornadoungroned))
	            scr_soundeffect(sfx_tornadoungroned);
	        
	        if (audio_is_playing(sfx_tornadogrounded))
	            audio_stop_sound(sfx_tornadogrounded);
	    }
	}
	else
	{
	    if (audio_is_playing(sfx_tornadogrounded))
	        audio_stop_sound(sfx_tornadogrounded);
	    
	    if (audio_is_playing(sfx_tornadoungroned))
	        audio_stop_sound(sfx_tornadoungroned);
	}
	
	if (sprite_index == spr_playerN_wallbounce)
	{
	    if (!audio_is_playing(sfx_noisewallbounce))
	        scr_soundeffect(sfx_noisewallbounce);
	}
	else if (audio_is_playing(sfx_noisewallbounce))
	{
	    audio_stop_sound(sfx_noisewallbounce);
	}
	
	audio_sound_gain(ballhit, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(turnintoball, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(jellyhit, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(jellywiggle, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(cheesestomp, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(cheesefall, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(burp02, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(Spititout01, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(Spititout02, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(Spititout03, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(Spititout04, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(Spititout05, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(ratjump, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(spank, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_noisejetpackstart, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_suplexdash, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_break, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_machslideboost, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream7, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream8, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream4, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream3, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream2, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream1, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream5, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream6, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_scream10, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_pepscream, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_noisescream, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_fireass, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_taunt, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_ultraparry, 10 * global.audiosfxvol, 0.1);
	
	if (audio_is_playing(thebeat) && !instance_exists(obj_boombox))
	    audio_stop_sound(thebeat);
}
