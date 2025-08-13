function scr_playersounds()
{
	if (state == states.freefall || state == states.freefallprep)
	{
	    if (!audio_is_playing(sfx_groundpoundstart) && !audio_is_playing(sfx_groundpoundloop))
	        scr_soundeffect(sfx_groundpoundloop);
	}
	else
	{
	    if (audio_is_playing(sfx_groundpoundloop))
	        audio_stop_sound(sfx_groundpoundloop);
	    
	    if (audio_is_playing(sfx_groundpoundstart))
	        audio_stop_sound(sfx_groundpoundstart);
	}
	
	if (state == states.mach1 && !audio_is_playing(mach1sound) && grounded)
	    scr_soundeffect(mach1sound);
	else if (state != states.mach1 || !grounded || move == -xscale)
	    audio_stop_sound(mach1sound);
	
	if ((sprite_index == spr_mach || state == states.climbwall) && !audio_is_playing(mach2sound))
	    scr_soundeffect(mach2sound);
	else if (sprite_index != spr_mach && state != states.climbwall)
	    audio_stop_sound(mach2sound);
	
	if ((state == states.mach3 || sprite_index == spr_player_machslideboost3) && sprite_index != spr_crazyrun && !audio_is_playing(mach3sound))
	    scr_soundeffect(mach3sound);
	else if ((state != states.mach3 && sprite_index != spr_player_machslideboost3) || sprite_index == spr_crazyrun)
	    audio_stop_sound(mach3sound);
	
	if ((state == states.knightpepslopes || state == states.grind || (state == states.Nfork && grounded)) && !audio_is_playing(sfx_knightslide))
	    scr_soundeffect(sfx_knightslide);
	else if (state != states.knightpepslopes && state != states.grind && ((state == states.Nfork && !grounded) || state != states.Nfork) && audio_is_playing(sfx_knightslide))
	    audio_stop_sound(sfx_knightslide);
	
	if ((sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode) && !audio_is_playing(sfx_bombpep1))
	    scr_soundeffect(sfx_bombpep1);
	else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && audio_is_playing(sfx_bombpep1))
	    audio_stop_sound(sfx_bombpep1);
	
	if (sprite_index == spr_crazyrun && !audio_is_playing(mach4sound))
	    scr_soundeffect(mach4sound);
	else if (sprite_index != spr_crazyrun)
	    audio_stop_sound(mach4sound);
	
	if (state != states.Sjumpprep && audio_is_playing(superjumpprepsound))
	    audio_stop_sound(superjumpprepsound);
	
	if (state != states.Sjumpprep && audio_is_playing(superjumpholdsound))
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
	
	if (state != states.tumble && sprite_index != spr_machroll)
	{
	    audio_stop_sound(sfx_tumble1);
	    audio_stop_sound(sfx_tumble2);
	    audio_stop_sound(sfx_tumble3);
	}
	
	if (audio_is_playing(sfx_suplexdash) && state != states.handstandjump)
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
	audio_sound_gain(sfx_greatermanrun, 0.25 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitch, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitch2, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitch3, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitch4, 0.5 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitchnew, 2 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitchnew2, 2 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitchnew3, 2 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_snickglitchnew4, 2 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_pursuerwhoop, 10 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_pursuerhit, 10 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_pursuerscream, 10 * global.audiosfxvol, 0.1);
	audio_sound_gain(sfx_pursuerhurt, 15 * global.audiosfxvol, 0.1);
	audio_sound_gain(mu_ranks, global.audiomusvol, 0.1);
	audio_sound_gain(mu_ranka, global.audiomusvol, 0.1);
	audio_sound_gain(mu_rankb, global.audiomusvol, 0.1);
	audio_sound_gain(mu_rankc, global.audiomusvol, 0.1);
	audio_sound_gain(mu_rankd, global.audiomusvol, 0.1);
	audio_sound_gain(mu_prank, global.audiomusvol, 0.1);
	
	if (audio_is_playing(thebeat) && !instance_exists(obj_boombox))
	    audio_stop_sound(thebeat);
	
	if (!instance_exists(obj_boombox))
	{
	    if (audio_is_playing(cw_amen02_165))
	        audio_stop_sound(cw_amen02_165);
	    
	    if (audio_is_playing(mu_evilbluutunee))
	        audio_stop_sound(mu_evilbluutunee);
	    
	    if (audio_is_playing(mu_imtoolazytotypeallatitsthenoisebreakdancemusic))
	        audio_stop_sound(mu_imtoolazytotypeallatitsthenoisebreakdancemusic);
	    
	    if (audio_is_playing(mu_breakdancemusicc))
	        audio_stop_sound(mu_breakdancemusicc);
	    
	    if (audio_is_playing(cw_amen02_165))
	        audio_stop_sound(cw_amen02_165);
	    
	    if (audio_is_playing(mu_vanityboombox))
	        audio_stop_sound(mu_vanityboombox);
	    
	    if (audio_is_playing(mu_vanityboomboxthesecond))
	        audio_stop_sound(mu_vanityboomboxthesecond);
	    
	    if (audio_is_playing(mu_sigmatic))
	        audio_stop_sound(mu_sigmatic);
	    
	    if (audio_is_playing(mu_veggieboombox))
	        audio_stop_sound(mu_veggieboombox);
	}
	
	if (!instance_exists(obj_pregnose))
	{
	    if (audio_is_playing(sfx_presidentpregnose))
	        audio_stop_sound(sfx_presidentpregnose);
	}
	
	if (!instance_exists(obj_hungrypillar))
	{
	    if (audio_is_playing(mu_dungeondepth))
	        audio_stop_sound(mu_dungeondepth);
	}
}
