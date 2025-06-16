function scr_gameover_setup()
{
	with (obj_player)
	{
	    state = 54;
	    sprite_index = spr_deathstart;
	    image_index = image_number - 1;
	    audio_stop_all();
	    scr_soundeffect(mu_timesup);
	    global.deathmode = 0;
	}
	
	if (instance_exists(obj_sigmaface))
	    instance_destroy(obj_sigmaface);
	
	if (instance_exists(obj_fadeout))
	    instance_destroy(obj_fadeout);
	
	if (instance_exists(obj_pausefadeout))
	    instance_destroy(obj_pausefadeout);
	
	if (instance_exists(obj_key))
	    instance_destroy(obj_key);
	
	if (instance_exists(obj_boilingsauce))
	    instance_destroy(obj_boilingsauce);
	
	global.panic = 0;
	global.snickchallenge = 0;
	global.draintime = 0;
}
