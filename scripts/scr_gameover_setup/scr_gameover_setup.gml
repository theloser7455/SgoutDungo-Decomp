function scr_gameover_setup()
{
	with (obj_player)
	{
	    state = states.gameover;
	    sprite_index = spr_deathstart;
	    image_index = image_number - 1;
	    
	    if (!global.instantR)
	    {
	        audio_stop_all();
	        global.deathmode = 0;
	        global.draintime = 0;
	    }
	    
	    instance_create(x, y, obj_gameoverrestart);
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
}
