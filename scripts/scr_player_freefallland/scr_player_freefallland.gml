function scr_player_freefallland()
{
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	movespeed = 0;
	facehurt = 1;
	start_running = 1;
	alarm[4] = 14;
	vsp = 0;
	hsp = 0;
	
	if (floor(image_index) == (image_number - 1) && !(superslam > 30))
	{
	    state = 0;
	    sprite_index = spr_idle;
	    
	    if (pepperplay)
	    {
	        state = states.playerpeppermanidle;
	        sprite_index = spr_Pidle;
	    }
	    
	    if (character == "R" && key_jump2)
	    {
	        scr_soundeffect(jellywiggle);
	        instance_create(x, y, obj_explosioneffect);
	        sprite_index = spr_superjump;
	        state = states.Sjump;
	        vsp = -20;
	    }
	}
	
	if (floor(image_index) == (image_number - 1) && superslam > 30)
	{
	    state = states.machfreefall;
	    vsp = -7;
	    
	    if (character == "R" && key_jump2)
	    {
	        scr_soundeffect(jellywiggle);
	        instance_create(x, y, obj_explosioneffect);
	        sprite_index = spr_superjump;
	        state = states.Sjump;
	        vsp = -20;
	    }
	}
	
	image_speed = 0.35;
}
