function scr_collide_destructibles()
{
	var markiplier = 15;
	
	if (state == states.mach2 || state == states.uppercut || state == states.stupidratjelly || state == states.NEWchainsaw || state == states.stupidratroll || state == states.breakdanceattack || state == states.punch || state == states.mach3 || state == states.machroll || state == states.knightpepslopes || state == states.tumble || state == states.hookshot || character == "TERRENCE" || state == states.kungfu || state == states.jetpack || state == states.crouchslide || state == states.wallbounce || state == states.Ncrusher || state == states.Nfork || state == states.playerpeppermanmach)
	{
	    if (place_meeting(x + hsp, y, obj_destructibles))
	    {
	        with (instance_place(x + hsp, y, obj_destructibles))
	            instance_destroy();
	        
	        if (state == states.mach2)
	            machpunchAnim = 1;
	    }
	    
	    if (place_meeting(x + (sign(hsp) * markiplier), y, obj_destructibles))
	    {
	        with (instance_place(x + hsp, y, obj_destructibles))
	            instance_destroy();
	        
	        if (state == states.mach2)
	            machpunchAnim = 1;
	    }
	}
	
	if ((state == states.knightpep || state == states.superslam || state == states.hookshot) && vsp > 0)
	{
	    if (place_meeting(x, y + 1, obj_destructibles))
	    {
	        with (instance_place(x, y + 1, obj_destructibles))
	            instance_destroy();
	    }
	}
	
	if (character == "TERRENCE" || state == states.uppercut || state == states.stupidratjelly || state == states.wallbounce || state == states.Ncrusher || state == states.jetpack || state == states.Nfork || state == states.playerpeppermangroundpound)
	{
	    with (instance_place(x, y + vsp, obj_destructibles))
	        instance_destroy();
	    
	    with (instance_place(x, y + (sign(vsp) * markiplier), obj_destructibles))
	        instance_destroy();
	}
	
	if (character == "TERRENCE")
	{
	    with (instance_place(x, y + vsp, obj_metalblock))
	        instance_destroy();
	}
	
	if (place_meeting(x, y + 1, obj_destructibleplatform))
	{
	    with (instance_place(x, y + 1, obj_destructibleplatform))
	    {
	        falling = 1;
	        
	        if (falling == 1)
	            image_speed = 0.35;
	    }
	}
	
	if (vsp <= 0.5 && (state == states.jump || state == states.climbwall || state == states.fireass || state == states.Sjump || state == states.mach2 || state == states.mach3))
	{
	    if (place_meeting(x, y - 1, obj_destructibles))
	    {
	        with (instance_place(x, y - 1, obj_destructibles))
	        {
	            instance_destroy();
	            
	            with (other.id)
	            {
	                if (state != states.Sjump && state != states.climbwall)
	                    vsp = 0;
	            }
	        }
	    }
	}
	
	if (vsp >= 0 && (state == states.freefall || state == states.stupidratcheeseslam || state == states.stupidratjelly || state == states.uppercut || state == states.freefallland))
	{
	    if (place_meeting(x, y + vsp + 2, obj_destructibles))
	    {
	        with (instance_place(x, y + vsp + 2, obj_destructibles))
	            instance_destroy();
	    }
	}
	
	if (state == states.freefall || state == states.freefallland)
	{
	    if (place_meeting(x, y + 1, obj_metalblock) && freefallsmash > 10)
	    {
	        with (instance_place(x, y + 1, obj_metalblock))
	            instance_destroy();
	    }
	}
	
	if (state == states.handstandjump)
	{
	    with (obj_destructibles)
	    {
	        if (place_meeting(x - obj_player.hsp, y, obj_player))
	        {
	            with (obj_player)
	            {
	                if (place_meeting(x + hsp, y, obj_bigdestructibles))
	                    instance_destroy(other.id);
	                else if (other.object_index != obj_bigdestructibles)
	                    instance_destroy(other.id);
	            }
	        }
	    }
	}
	
	with (obj_baddie)
	{
	    if (place_meeting(x + hsp, y, obj_destructibles) && thrown == 1)
	        instance_destroy(instance_place(x + hsp, y, obj_destructibles));
	    
	    if (place_meeting(x, y + vsp, obj_destructibles) && thrown == 1)
	        instance_destroy(instance_place(x + vsp, y, obj_destructibles));
	}
}
